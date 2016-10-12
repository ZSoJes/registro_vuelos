class Booking < ActiveRecord::Base

  def add(var1, var2, var3, var4)
    book = Booking.new do |t|
        t.no_vuelo       = var1
        t.no_reservacion = var2
        t.nombre_p       = var3
        t.correo_p       = var4
    end
    book.save
end

def pasajero_x_reservacion(id, reserv)
    pasajero = Booking.where(id: id, no_reservacion: reserv)
end

end