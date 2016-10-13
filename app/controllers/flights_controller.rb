class FlightsController
  def initialize
    # (args)
    # @args = args
    @flight = Flight.new
    @booking = Booking.new
    @view = FlightsView.new

    execute
  end

  def index
    @view.index(@flight.index)
  end

  def mostrar_filtro(val1, val2, val3, val4)
   datoID = @view.mostrar_filtro(@flight.mostrar_filtro(val1, val2, val3),val4)  
   if datoID != []
     p "desea reservar este vuelo?(introduzca si o no)"
     resp = respuesta

     if resp == 'si' or resp == 'Si'
       reservacion = rand(0..1000)
       print "\n\n#{"*"*52}\n\n"
       @view.mostrar_seleccion(@flight.mostrar_seleccion(datoID))

       @flight.update(datoID, val4)

       for i in 1..(val4.to_i)
         p "Pasajero Num. #{i}:"
         print "\n\tIntroduzca su nombre: "
         nombre = respuesta
         print "\n\tIngrese su correo: "
         correo = respuesta         
         @booking.add(datoID, reservacion, nombre, correo)
         print "\n#{"*"*52}\n"
       end

       anima
       p "Registro Terminado Con Exito!"
       pasajero_data = @booking.pasajero_x_reservacion(reservacion)
       puts
       puts "::::::::::::::::::::::::Ticket::::::::::::::::::::::::"
       for i in 0...(val4.to_i)
         @view.mostrar_seleccion(@flight.mostrar_seleccion(datoID))
         @view.pasajero_x_reservacion(pasajero_data[i], i+1)
         puts "No de Reservacion: #{reservacion}\n"
         puts ":::::::::::::::::::::::::::::::::::::::::::::::::::::::"
       end

       @flight.precio_v(datoID).each do |x|
        costo_viaje = (x.precio[1..-1].to_i)
        puts "\n::::::::::::::::::::::::::::::TOTAL: #{costo_viaje*val4.to_i}"
      end

      p "Desea terminar reservaciones(Si-No)?"
      continuar = respuesta
      if continuar == 'si' or continuar == 'Si'
        anima
        usuario
      else
        anima
        compra
      end
    end
    else
      puts "El vuelo que desea no se encuentra disponible\n"
      puts "A continuacion cargara el menu"
      sleep(4.0)
      anima
    end
  end #termina aquí

  def compra
    p "Introduzca Origen del Vuelo"
    val1 = respuesta
    p "Introduzca Destino"
    val2 = respuesta
    p "Fecha del vuelo"
    val3 = respuesta
    p "Lugares que desea reservar"
    val4 = respuesta
    mostrar_filtro(val1 ,val2, val3, val4)
  end

  def usuario
    @view.menu_usuario
    menu = respuesta

    while menu != "3"
      if menu == "1"
        index
      elsif menu == "2"
        compra
      end
      @view.menu_usuario
      menu = respuesta
    end
  end

  def respuesta
    resp = STDIN.gets.chomp
    return resp
  end

  def anima
    print "\e[2J"
    print "\e[H"
  end

  def execute
  @view.session
  session = respuesta
  anima
  case session
  when 'a', 'A' then
    @view.session_t('Cliente')
    usuario
  when 'b', 'B' then
    @view.session_t('Administrador')
    @view.menu_admin
  else
    "Try again or write exit"
  end
  end

end