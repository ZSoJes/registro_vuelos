
class CreateTasks < ActiveRecord::Migration
  def change
    create_table :flights do |t|
            t.string :date                  #fecha creada del vuelo
            t.string :departs               # fecha de salida del vuelo
            t.string :from                  # lugar de donde sale el vuelo
            t.string :to                    # lugar a donde llega
            t.string :duration              # duracion del viaje
            t.string :precio                # precio
            t.string :lugares_disponibles   # 50
    end

    create_table :bookings do |t|
      t.string :no_vuelo
      t.string :no_reservacion
      t.string :nombre_p
      t.string :correo_p
    end
  end

end
