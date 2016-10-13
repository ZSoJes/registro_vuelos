class FlightsView

  def session
    puts "**** Bienvenido a la interfaz de Registro para Vuelos ****"
    puts "Indique tipo de usuario"
    puts "\na) Cliente"
    puts "\nb) Administrador"
  end

  def menu_usuario
    puts "::::::::::::::  Menu Cliente  ::::::::::::::"
    puts "\n1. Mostrar todos los vuelos"
    puts "\n2. Buscar vuelo por Origen, Destino, Fecha, Lugares"
    puts "\n3. Salir"
  end

  def menu_adm
    puts "::::::::::::::  Menu Administrador  ::::::::::::::"
    puts "1. Mostrar todos los vuelos"
    puts "2. Crear Vuelo"
    puts "3. Borrar reservacion"
    puts "4. Actualizar reservacion"
  end

  def session_t(tipo)
    puts '::::Sesion iniciada como: '
    resp = "\t#{tipo}"
    (resp.length).times { |i| print resp[i] 
      sleep(0.1) }
      puts
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
    puts
    dato.each do |x|
      puts "*"*52
      puts "Caracteristicas:\n"
      puts "Vuelo de: #{x.from}\tCon destino a: #{x.to}"
      puts "Date: #{x.date} No. de Lugares solicitados: #{passengers}"
      puts "*"*52
      puts
      return no_vuelo = x.id
    end
  end
 
  def pasajero_x_reservacion(reservacion,pasajero)
         puts "::::::::::::::::Pasajero #{pasajero}: #{reservacion.nombre_p}"
         puts "::::::::Correo: #{reservacion.correo_p}"
         puts
  end

  def mostrar_seleccion(dato)
    print "Caracteristicas Detalladas:\n\n"
    dato.each do |x|
        puts "No. de Vuelo: 00#{x.id} \t\tDate: #{x.date}"
        puts "#{(x.departs).gsub(/[\["\]]/,"")}"
        puts "Desde: #{x.from}\tCon destino a: #{x.to}"
        puts "Duracion del viaje: #{x.duration}"
        puts "\n"
    end
  end
end
