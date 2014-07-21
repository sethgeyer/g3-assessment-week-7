require 'sinatra/base'
require 'gschool_database_connection'

require './lib/country_list'
require "./lib/messages"

class Application < Sinatra::Application

  def initialize
    super
    @messages = Messages.new(GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV']))
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])
  end

  get '/' do
    all_messages = @messages.see_all_messages
    erb :index, locals: {all_messages: all_messages}
  end

  post "/new_message" do
    @messages.add_message_to_dbase(params[:message], params[:name])
    redirect "/"
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

end