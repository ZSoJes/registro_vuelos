class FlightsView

  def menu
    puts "1. Mostrar todos los vuelos"
    puts "2. Buscar vuelo por From, To, Date, Passengers"
    puts "3. Borrar reservacion"
    puts "4. Actualizar reservacion"
  end

	def index(dato)
    dato.each do |x|
        puts "No. de Vuelo: 00#{x.id} \t\tDate: #{x.date}"
        puts "#{(x.departs).gsub(/[\["\]]/,"")}"
        puts "Desde: #{x.from}\tCon destino a: #{x.to}"
        puts "Duracion del viaje: #{x.duration}\tPrecio: #{x.precio}"
        puts "No. de Lugares Disponibles:#{x.lugares_disponibles}"
      puts
      puts
      end   
	end

  def mostrar_filtro(dato, passengers)
    dato.each do |x|
      puts "*"*52
      puts "Vuelo de: #{x.from}\tCon destino a: #{x.to}"
      puts "Date: #{x.date} No. de Lugares solicitados: #{passengers}"
      puts "*"*52
      puts
      return no_vuelo = x.id
    end
  end
 
  def pasajero_x_reservacion(reservacion,pasajero)
    reservacion.each do |x|
         puts "::::::::::::::::Pasajero #{pasajero}: #{x.nombre_p}"
         puts "::::::::Correo: #{x.correo_p}"
    end
         puts
  end

  def mostrar_seleccion(dato)
    puts
    dato.each do |x|
        puts "No. de Vuelo: 00#{x.id} \t\tDate: #{x.date}"
        puts "#{(x.departs).gsub(/[\["\]]/,"")}"
        puts "Desde: #{x.from}\tCon destino a: #{x.to}"
        puts "Duracion del viaje: #{x.duration}"
    end
  end
end
