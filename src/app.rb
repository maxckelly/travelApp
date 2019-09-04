require 'tty-prompt'
require 'tty-spinner'
require 'csv'
require 'json'
require_relative 'user_class.rb'
require_relative 'travel_methods.rb'
require_relative 'trips_class.rb'
require_relative 'countries_method.rb'

file = File.open "countries.json" # Loads the the countries.json file
data = JSON.load file # Opens the countries.json file
prompt = TTY::Prompt.new

# The below collects the user information and adds it into the has use_info_input
user_info_input = prompt.collect do 
    key(:name).ask("What is your name?")
    key(:email).ask("Please enter in your email address:") do |q|
        q.validate(/\A\w+@\w+\.\w+\Z/)
        q.messages[:valid?] = "Invalid email address, please try again"
    end
    key(:password).mask("Please create a password:")
end

system('clear') # clear system of the above output.
user = User.new(user_info_input) # User created in user class (user.rb)
trip = nil # This defines the varible trip and then reassigns the data down in the loop
trip_array = []

puts "Welcome #{user_info_input[:name]}! Please select one of the below options."

loop do 
    user_menu = prompt.select("Please select on of the below options...Use ↑/↓ arrow keys, press Enter to select") do |menu|
        menu.choice "View my details"
        menu.choice "View my trips"
        menu.choice "Create a trip"
        menu.choice "Spin the globe"
        menu.choice "Download Itinerary"
        menu.choice "Exit app"
    end

    case 
        when user_menu == "View my details" # This simply views the user details such as email, name etc..
            system('clear')
            puts user_info_input[:name]
            puts user_info_input[:email]
        when user_menu == "Create a trip" # This section creates a trip.
            loop do 
                trip_creation = prompt.collect do 
                    key(:origin_destination).ask("Where will you be departing from?")
                    key(:start_date_of_trip).ask("What date will you be departing? The date needs to be in day/month/year")
                    key(:end_date_of_trip).ask("What date will you be returning?")
                    key(:destination).ask("Where will you be travelling too?")
                end
            
                trip_array << trip_creation # Pushes trip_creation into array

                destination_menu = prompt.select("Would you like to add a destination or finish trip creation?") do |menu|
                    menu.choice "Add destination"
                    menu.choice "Finish"
                end

                if (destination_menu == "Finish") # Breaks out of the loop that is in the user_menu
                    trip = Trips.new(trip_array) # Creates a new trip class
                    break
                end
            end
        when user_menu == "View my trips" # This section displays all the trips the user has created
            system('clear')
            puts Travel.individual_trips(trip_array)

            if (trip_array.empty?)
                puts "You have no trips planned yet!"
            end
            
        when user_menu == "Spin the globe"

            puts "-------------------------------"
            spinner = TTY::Spinner.new("[:spinner] We're spinning the globe...🌍 🌎 🌏 ", format: :spin_2)
            spinner.auto_spin # Automatic animation with default interval
            sleep(5) # Perform task
            spinner.stop("\nYour off too...✈️ ️✈️  - #{Countries.countries(data).sample}") # Stop animation # Also grabes the method from countries_method.rb
            puts "-------------------------------"

        when user_menu == "Download Itinerary"

            prompt.select("Please select the trip you would like the itinary for", Travel.create_destinations(trip_array), filter: true)

            CSV.open("itinerary.csv", "a+", {headers: true}) do |line|
                line << [1,trip_array[0][:origin_destination],trip_array[0][:start_date_of_trip],trip_array[0][:end_date_of_trip],trip_array[0][:destination]]
            end
        when user_menu == "Exit app" # Breaks out of loop
            system('clear')
            puts "See you again soon"
            break
    end
end
