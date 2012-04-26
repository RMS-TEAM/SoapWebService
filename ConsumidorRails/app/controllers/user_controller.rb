class UserController < ApplicationController

  def index
    if signed_in?
      redirect_to "/users/new"
    else
      @title = "Banca Eletronica Cooperativa"
      client = soap_service
      respuesta = client.request :web, :get_cooperativas
      if respuesta.success?
        r = respuesta.to_array(:get_cooperativas_response).first
        if r
          respuesta = r[:return]
          entro = respuesta[0]

          if entro
            @cooperativas = respuesta[1..respuesta.length]
          else
            flash[:error] = "Error al traer la lista de cooperativas"
            redirect_to root_path
          end
        end
      end
    end
  end

  def new
    @title = "Ingreso"
    cedula = params[:cedula]
    pass = params[:password]
    cooperativa = params[:cooperativa]
    if signed_in?
      @mensaje = "Sigues conectado"
    elsif cedula.blank? || pass.blank? || cooperativa.blank?
      redirect_to root_path
    else
      client = soap_service
      respuesta = client.request :web, :ingresar, :body=> {"arg0"=> cedula, "arg1" => pass}
      if respuesta.success?
        r = respuesta.to_array(:ingresar_response).first
        if r
          respuesta = r[:return]
          entro = respuesta[0]
          @mensaje = respuesta[1]
          if entro
            set_token respuesta[2]
            set_cedula(cedula)
            set_cooperativa(cooperativa)
          else
            flash[:error] = @mensaje.capitalize
            redirect_to root_path
          end
        end
      end
    end
  end

  def show
     @title = "Saldos"
     @response1  = [["cooprudea",'ahorro1','123-4567-89',50000],["cooprudea1",'ahorro2','123-4567-33',440000]]
     @response2 = [['cooprudea', 'Casa', '54567856',40000000],['cooprudea', 'Estudios', '54666856',2000000],['cooprudea', 'Carro', '57856',25000000]]
  end

  def detalles
    @title = "movimientos"
    @response1  = [["cooprudea",'ahorro1','123-4567-89',50000],["cooprudea1",'ahorro2','123-4567-33',440000]]
    @response2 = [['cooprudea', 'Casa', '54567856',40000000],['cooprudea', 'Estudios', '54666856',2000000],['cooprudea', 'Carro', '57856',25000000]]

  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
