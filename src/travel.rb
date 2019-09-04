module Travel
    def self.creating_trip
    
    end 

    def self.create_destinations(trip_array) 
        destinations = trip_array.map do |trip|
            trip[:destination]
        end 
        return destinations
    end 
end  
