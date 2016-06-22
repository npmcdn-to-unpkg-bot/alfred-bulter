class VariantDatatable < Datatable
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
    user_stocks.map do |variant|
      [
        
        "#{product(variant.product_id).title} - #{variant.title}",
        variant.sku,
        variant.inventory_quantity,
        variant.price,
      ]
    end
  end

  def product(product_id)
    if @product_hsh[product_id].blank?
      @product_hsh[product_id] = ShopifyHelper.product(current_shop,product_id)
    end
    @product_hsh[product_id]
  end

  def user_stocks
    @user_stocks ||= fetch_data
  end

  def fetch_data
    stocks = ShopifyHelper.variants(current_shop,page,per_page)
    stocks = WillPaginate::Collection.create(page, per_page, total_records) do |pager|
      pager.replace(stocks.to_a)
    end
    stocks
  end

  def total_records
    @total_records ||= ShopifyHelper.variants_count(current_shop)
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

end
