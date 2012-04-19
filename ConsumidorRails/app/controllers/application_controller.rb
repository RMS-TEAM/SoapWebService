class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :soap_service, :get_token, :signed_in?, :set_token, :set_cedula, :get_cedula, :set_cooperativa, :get_cooperativa

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

  def get_cedula
    @cedula
  end

  def set_cedula(cedula)
    @cedula = cedula
  end

  def get_cooperativa
    @cooperativa
  end

  def set_cooperativa(cooperativa)
    @cooperativa = cooperativa
  end

  def signed_in?
    if @token.eql? ""
      return false
    else
      client = soap_service
      respuesta = client.request :web, :conectado, :body=> {"arg0"=> @token}
      if respuesta.success?
        r = respuesta.to_array(:conectado_response).first
        if r
          respuesta = r[:return]
        end
      end
    end
  end

  private
  @token = ""
  @cedula
  @cooperativa

end
