class SetupRequestDatatable < Datatable
  delegate :params, :h, :link_to, :time_ago_in_words, :current_shop, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      recordsTotal: user_requests ? user_requests.count : 0,
      recordsFiltered: user_requests ? total_records : 0,
      data: data
    }
  end

private
  def data
    return [] unless user_requests
    user_requests.map do |request|
      [
        request.created_at
      ]
    end
  end

  def user_requests
    @user_requests ||= fetch_data
  end

  def fetch_data
    requests = current_shop.setup_requests.order(created_at: :desc)
    requests = requests.page(page).per_page(per_page)
    requests
  end

  def total_records
    @total_records ||= current_shop.setup_requests.count
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

end
