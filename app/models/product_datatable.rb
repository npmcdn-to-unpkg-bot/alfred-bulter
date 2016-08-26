class ProductDatatable < Datatable
  delegate :params, :h, :link_to, :time_ago_in_words, :current_shop, :update_ignore_home_index_url, to: :@view

  def initialize(view)
    @view = view
    @product_hsh = {}
  end

  def as_json(options = {})
    {
      recordsTotal: user_stocks ? user_stocks.count : 0,
      recordsFiltered: user_stocks ? total_records : 0,
      data: data
    }
  end

private
  def data
    return [] unless user_stocks
    user_stocks.map do |product|
      [
        product.title,
        product.body_html,
        product.vendor,
        product.tags,
        link_to("Variants",@view.product_stocks_url(product))
      ]
    end
  end

  def user_stocks
    @user_stocks ||= fetch_data
  end

  def fetch_data
    stocks = ShopifyHelper.products(current_shop,page,per_page)
    stocks = WillPaginate::Collection.create(page, per_page, total_records) do |pager|
      pager.replace(stocks.to_a)
    end
    stocks
  end

  def total_records
    @total_records ||= ShopifyHelper.products_count(current_shop)
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

end
