require 'active_record'
require 'sqlite3'
require 'yaml'
require_relative '../app/models/booking'
require_relative '../app/models/flight'
require_relative '../app/controllers/flights_controller'
require_relative '../app/views/flights_view'

configuration = YAML::load_file(File.join(__dir__, 'database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])
