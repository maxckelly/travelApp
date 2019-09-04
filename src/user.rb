# require_relative 'app.rb'

class User
    attr_accessor :name, :email, :password, :location

    def initialize(hash)
        @name = hash[:name] 
        @email = hash[:email]
        @password = hash[:password] 
        @location = hash[:location]
    end
end

