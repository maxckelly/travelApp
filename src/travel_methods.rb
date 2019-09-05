module Travel

    def self.create_destinations(trip_array) 
        destinations = trip_array.map do |trip|
            trip[:destination]
        end 
        return destinations
    end 

    def self.individual_trips(trip_array)
        individual_trip = trip_array.map do |trip|
            "You are leaving #{trip[:origin_destination]} on the #{trip[:start_date_of_trip]} and arriving into #{trip[:destination]}. The end of your trip is on #{trip[:end_date_of_trip]}"
        end
        return individual_trip
    end
end  
