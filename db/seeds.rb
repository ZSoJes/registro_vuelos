# Este archivo sirve para crear registros de prueba
require 'faker'
require 'date'

flight_data = Array.new
time = [:morning, :evening]

for var in 0..20
    from     = Faker::Address.state
    to       = Faker::Address.state
    date     = Faker::Date.forward(rand(10..20)).strftime("%d-%m-%Y")
    2.times{
      duration = "#{rand(2..8)}hrs"
      departs  = Faker::Time.forward(rand(10..20), time[rand(0..1)]).strftime("El día #{date}               A las %I:%M %P")
      precio   = "$#{rand(500..2000)}"
      lugares  = rand(20..50)
              
    Flight.new.add(date, [departs], from, to, duration, precio, lugares) }
end

p ":::::\\ Flights listos //:::::"



# require 'faker'
# require 'date'

# flight_data = Array.new
# time = [:morning, :evening]

# for var in 0..20
#     date     = Faker::Date.backward(rand(1..7)).strftime("%d-%m-%Y")
#     departs  = Faker::Time.forward(rand(10..20), time[rand(0..1)]).strftime("El día %d-%m-%Y               A las %I:%M %P")
#     from     = Faker::Address.state
#     to       = Faker::Address.state
#     duration = "#{rand(2..8)}hrs"
#     precio   = "$#{rand(500..2000)}"
#     lugares  = rand(20..50)
    
#   Flight.new.add(date, [departs], from, to, duration, precio, lugares)
# end

# p ":::::\\ Flights listos //:::::"