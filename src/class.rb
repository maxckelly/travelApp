require_relative './app.rb'

class Users

    attr_accessor :name, :email, :password, :location

    def initialize()
        @name = ""
        @email = ""
        @password = ""
        @location = ""
    end
end
