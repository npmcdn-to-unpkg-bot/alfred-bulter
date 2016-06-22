class Datatable
  delegate :params, :h, :link_to, :current_shop, :time_ago_in_words, to: :@view

  def initialize(view,params={})
    @view = view
    @params = params
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: rows ? rows.count : 0,
      iTotalDisplayRecords: rows ? rows.total_count : 0,
      aaData: data
    }
  end

  def rows
    @rows ||= fetch_datas
  end

  def fetch_datas
  end

  def page
    if params[:iDisplayStart].present? 
      params[:iDisplayStart].to_i/per_page + 1
    else
      params[:start].to_i/per_page + 1
    end
  end

  def per_page
    if params[:iDisplayLength].present?
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    else
      params[:length].to_i > 0 ? params[:length].to_i : 10
    end
  end

  def columns
    %w[]
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
  
end