class SetupRequestDecorator < Draper::Decorator
  delegate_all

  def index_link
  	h.link_to "Setup Request", h.root_url
  end

  def new_link
  	h.link_to "New", h.new_setup_request_url
  end

  def new_btn
  	h.link_to "New", h.new_setup_request_url, class: "btn btn-primary"
  end

end
