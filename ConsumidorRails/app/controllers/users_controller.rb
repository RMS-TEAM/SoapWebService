class UsersController < ApplicationController
  before_filter :autorizado, :only=>[:show, :detalles, :show]
  def index
    if signed_in?
      redirect_to "/users/show"
    else
      @title = "Banca Eletronica Cooperativa"
      begin
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
              @cooperativas = []
              flash[:error] = "Error al traer la lista de cooperativas"
              redirect_to root_path
            end
          end
        end
      rescue
        flash[:error] = "Error al cargar las cooperativas"
        @cooperativas= []
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
      flash[:error] = "Debes de llenar todos los datos"
      redirect_to root_path
    else
      client = soap_service
      respuesta = client.request :web, :ingresar, :body=> {"arg0"=> cedula, "arg1" => pass, "arg2" => cooperativa}
      if respuesta.success?
        r = respuesta.to_array(:ingresar_response).first
        if r
          respuesta = r[:return]
          entro = respuesta[0]
          if entro
            set_token respuesta[2]
            set_cedula(cedula)
            set_cooperativa(cooperativa)
            set_ultima_visita(respuesta[1])
            redirect_to '/users/show'
          else
            flash[:error] = "Datos de entrada erroneos"
            redirect_to root_path
          end
        end
      end
    end
  end

  def show
    @title = "Saldos"
    client = soap_service
    respuesta = client.request :web, :show, :body=> {"arg0"=> get_cedula}
    if respuesta.success?
      r = respuesta.to_array(:show_response).first
      if r
        respuesta = r[:return]
        entro = respuesta[0]
        if entro
          @cuenta = respuesta[1..respuesta.size]
        else
          flash[:error] = "Error al traer los datos del servidor"
        end
      end
    end
    @response2 = [['cooprudea', 'Casa', '54567856',40000000],['cooprudea', 'Estudios', '54666856',2000000],['cooprudea', 'Carro', '57856',25000000]]
  end

  def detalles
    @title = "Movimientos"
    client = soap_service
    respuesta = client.request :web, :detalle, :body=> {"arg0"=> get_cedula, "arg1"=> params[:cuenta]}
    if respuesta.success?
      r = respuesta.to_array(:detalle_response).first
      if r
        respuesta = r[:return]
        entro = respuesta[0]
        if entro
          @detalles = respuesta[1..respuesta.size]
        else
          flash[:error] = "Error al traer los datos del servidor"
        end
      end
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Salida Exitosa"
    redirect_to root_path
  end

  private

  def autorizado
    if !signed_in?
      flash[:error] = "Salida Exitosa"
      redirect_to "/users/new"
    end
  end

end
