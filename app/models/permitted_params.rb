class PermittedParams < Struct.new(:params)
  def setup_request
    params.require(:setup_request).permit(*setup_request_attributes)
  end

  def setup_request_attributes
  	[
  		:name, :email, :subject, :source_type, :file_format, :description
  	]
  end
end
