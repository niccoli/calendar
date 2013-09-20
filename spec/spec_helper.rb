require 'active_record'
require 'rspec'

require 'event'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Event.all.each {|event| event.destroy}
  end
end
