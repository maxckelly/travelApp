require 'tty-prompt'
require 'tty-spinner'
require 'geocoder'
require_relative 'user.rb'
require_relative 'travel.rb'
require_relative 'trips.rb'
require 'pry'

prompt = TTY::Prompt.new

# The below collects the user information and adds it into the has use_info_input
user_info_input = prompt.collect do 
    key(:name).ask("What is your name?")
    key(:location).ask("What country do you call home?")
    key(:email).ask("Please enter in your email address:") do |q|
        q.validate(/\A\w+@\w+\.\w+\Z/)
        q.messages[:valid?] = "Invalid email address, please try again"
    end
    key(:password).mask("Please create a password:")
end

system('clear') # clear system of the above output.
user = User.new(user_info_input) # User created in user class (user.rb)
trip = nil # This defines the vadrible trip and then reassigns the data down in the loop

puts "Welcome #{user_info_input[:name]}! Please select one of the below options."

loop do 
    user_menu = prompt.select("Please select on of the below options...Use ↑/↓ arrow keys, press Enter to select") do |menu|
        menu.choice "View my details"
        menu.choice "View my trips"
        menu.choice "Create a trip"
        menu.choice "Spin the globe"
        menu.choice "Exit app"
    end
    case 
        when user_menu == "View my details" # This simply views the user details such as email, name etc..
            system('clear')
            puts user_info_input[:name]
            puts user_info_input[:location]
            puts user_info_input[:email]
        when user_menu == "Create a trip" # This section creates a trip.
            loop do 
                trip_creation = prompt.collect do 
                    key(:origin_destination).ask("Where will you be departing from?")
                    key(:start_date_of_trip).ask("When will you be departing?")
                    key(:end_date_of_trip).ask("What date will you be returning?")
                    key(:destination).ask("Where will you be travelling too?")
                end
                
                destination_menu = prompt.select("Would you like to add a destination or finish trip creation?") do |menu|
                    menu.choice "Add destination"
                    menu.choice "Finish"
                end

                if (destination_menu == "Finish") # Breaks out of the loop that is in the user_menu
                    binding.pry
                    trip = Trips.new(trip_creation)
                    break
                end
            end
        when user_menu == "View my trips" # This section displays all the trips the user has created
            p trip
        when user_menu == "Spin the globe"
            puts "Off we go!!!"
        when user_menu == "Exit app" # Breaks out of loop
            system('clear')
            puts "See you again"
            break
    end
end
