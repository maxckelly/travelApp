# Traveller App

### Wednesday 4th September 2019

- Today I worked through the general structure of the application. My first approach was to create the 'skeleton' which included the menus, where that directed people and the general flow of the application. See below code of some work.

```
user_menu = prompt.select("Please select on of the below options...Use ↑/↓ arrow keys, press Enter to select") do |menu|
    menu.choice "View my details"
    menu.choice "View my trips"
    menu.choice "Create a trip"
    menu.choice "Spin the globe"
    menu.choice "Download Itinerary"
    menu.choice "Exit app"
end
```

- I also created the user_info_input which collected all the necessary user information such as email, name and password. This was done in a array of hashes.

- I also created a basic structure which included a case, if statement and classes which are located in different files named trips_class.rb and user_class.rb

```
class Trips
    attr_accessor :origin_destination, :start_date_of_trip, :end_date_of_trip, :destination

    def initialize(array)
        @origin_destination = array[0]
        @start_date_of_trip = array[1]
        @end_date_of_trip = array[2]
        @destination = array[3]
    end
end
```

```
class User
    attr_accessor :name, :email, :password, :location

    def initialize(hash)
        @name = hash[:name] 
        @email = hash[:email]
        @password = hash[:password] 
        @location = hash[:location]
    end
end

```
### Thursday 5th September 2019

- Today I worked through a number of things some being fixing up the CSV issue, I managed to create an incremental ID which when every trip has been created the ID number goes up. This was done with a Counter += 1. 

- Along with this I have implemented a automated test which tests to see if the CSV file is being added correctly. This passed all the tests. 

- I implemented a “Spin The Globe” feature. This features selects a random country which the user will visit. The every country is stored in a file JSON file named countries.json. I created a module called Countries and coded it to read through the JSON file and accessing the array of of country names.

- I implemented an ARGV method as well which tasks a string. This is located in the ARGV_method file. 

- I also implemented the build.sh file this is creating a new directory called dist and moving the code from app.rb to that file. 

- I have also been working on documentation in the README.md file, user testing and more.
### Friday 6th September 2019

