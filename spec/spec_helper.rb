ENV['RACK_ENV'] = 'test'
require 'gschool_database_connection'
require 'capybara/rspec'

require './application'
Capybara.app = Application

RSpec.configure do |config|
  config.before do
    database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])

    database_connection.sql('BEGIN')
  end

  config.after do
    database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])

    database_connection.sql('ROLLBACK')
  end
end



def create_a_sample_message(name)
  fill_in "Name", with: name
  fill_in "Message", with: "This is a #{name} test message"
  click_on "Add Message"
end