require 'active_record'
require './lib/event'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)

