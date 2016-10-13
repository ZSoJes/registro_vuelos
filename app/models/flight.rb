class Flight < ActiveRecord::Base

  def index
    Flight.all
  end

  def add(var1, var2, var3, var4, var5, var6, var7)
    flight = Flight.new do |t|
      t.date = var1
      t.departs = var2
      t.from = var3
      t.to = var4
      t.duration = var5
      t.precio = var6
      t.lugares_disponibles = var7
    end
    flight.save
  end

  def mostrar_filtro(val1, val2, val3)
    flight_show = Flight.where(from: val1, to: val2, date: val3).order(id: :asc)
  end

  def mostrar_seleccion(id)
    flight_select = Flight.where(id: id)
  end

  def update(id, passengers)
    upd = Flight.where(id: id)
    
    upd.each { |x|  
      updat = Flight.find_by(id: id)
      updat.lugares_disponibles = (x.lugares_disponibles).to_i-passengers.to_i
      updat.save }
  end

  def precio_v(id)
    pre = Flight.where(id: id)
  end

end