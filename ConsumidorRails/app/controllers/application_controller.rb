class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :soap_service, :signed_in?, :get_token, :set_token, :set_cedula, :get_cedula, :set_cooperativa, :get_cooperativa, :sign_out

  def soap_service
    @client = Savon::Client.new do
      wsdl.document = "http://localhost:8080/WebService/login?wsdl"
    end
  end

  def get_token
    cookies[:token]
  end

  def set_token(token)
    cookies[:token] = { :value => token, :expires => 10.minute.from_now }
  end

  def get_cedula
    cookies[:cedula]
  end

  def set_cedula(cedula)
    cookies[:cedula] = { :value => cedula, :expires => 10.minute.from_now }
  end

  def get_cooperativa
    cookies[:cooperativa]
  end

  def set_cooperativa(cooperativa)
    cookies[:cooperativa] = { :value => cooperativa, :expires => 10.minute.from_now }
  end

  def signed_in?
    if cookies[:token].nil? || cookies[:token].blank?
       false
    else
      client = soap_service
      respuesta = client.request :web, :conectado, :body=> {"arg0"=> cookies[:token]}
      if respuesta.success?
        r = respuesta.to_array(:conectado_response).first
        if r
          respuesta = r[:return]
        end
      end
      if respuesta.eql? false
        sign_out
      end
       respuesta
    end
  end

  def sign_out
    client = soap_service
    respuesta = client.request :web, :salir, :body=> {"arg0"=> cookies[:token]}
    if respuesta.success?
      r = respuesta.to_array(:conectado_response).first
      if r
        respuesta = r[:return]
      end
    end
    cookies.delete(:token)
    cookies.delete(:cedula)
    cookies.delete(:cooperativa)
  end

end
