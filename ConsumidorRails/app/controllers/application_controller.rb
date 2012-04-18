class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :soap_service, :get_token, :set_token

  def soap_service
    @client = Savon::Client.new do
      wsdl.document = "http://localhost:8080/WebService/login?wsdl"
    end
  end

  def get_token
    @token
  end

  def set_token(token)
    @token = token
  end

  private
  @token

end
