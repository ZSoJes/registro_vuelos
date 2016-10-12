class FlightsController
  def initialize(args)
    @args = args
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

   p "desea reservar este vuelo?(introduzca si o no)"
   resp = respuesta_vuelo

   if resp == 'si' or resp == 'Si'
     reservacion = rand(0..1000)
     print "\n\n"
     puts "*"*52
     print "\n\n"
     @view.mostrar_seleccion(@flight.mostrar_seleccion(datoID))

     @flight.update(datoID, val4)

     for i in 1..(val4.to_i)
       p "Pasajero Num. #{i}:"
       print "\n\tIntroduzca su nombre: "
       nombre = registro_pasajero
       print "\n\tIngrese su correo: "
       correo = registro_pasajero         
       @booking.add(datoID, reservacion, nombre, correo)
       puts "*"*52
       puts
     end


     p "Registro Terminado Con Exito!"
     puts
     p "::::::::::::::::::::::::Ticket::::::::::::::::::::::::"
     for i in 0..(val4.to_i)
      @view.mostrar_seleccion(@flight.mostrar_seleccion(datoID))
      @view.pasajero_x_reservacion(@booking.pasajero_x_reservacion(i, 501),i)
      puts "No de Reservacion: #{reservacion}"
      p ":::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    end

    @flight.precio_v(datoID).each do |x|
      costo_viaje = (x.precio[1..-1].to_i)
      p "::::::::::::::::::::::::::::::TOTAL: #{costo_viaje*val4.to_i}"
    end
  end
  end #termina aquí

  def respuesta_vuelo
    resp = STDIN.gets.chomp
    return resp
  end

  def registro_pasajero
    reg = STDIN.gets.chomp
    return reg
  end

  def execute
    if @args[0] == "index"
      index
    elsif @args[0] == "reserva_vuelo"
      mostrar_filtro(@args[1], @args[2], @args[3], @args[4])
    end
  end

end