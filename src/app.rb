require 'tty-prompt'
require 'tty-spinner'
require 'geocoder'
require_relative 'class.rb'

prompt = TTY::Prompt.new

# user_one = Users.new()

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
        when user_menu == "View my details"
            system('clear')
            puts user_info_input
        when user_menu == "View my trips"
            puts "Here are the trips"
        when user_menu == "Create a trip"
            puts "You're creating a trip"
        when user_menu == "Spin the globe"
            puts "Off we go!!!"
        when user_menu == "Exit app"
            break
    end
end

