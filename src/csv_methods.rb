require 'csv'
require 'pry'

def read_csv_to_increment_id 
    file = File.read('itinerary.csv')
    id = CSV.parse(file).last.first.to_i
    return id + 1
end

def write_to_csv(trip_array)
    next_id = read_csv_to_increment_id
    CSV.open("itinerary.csv", "a+", {headers: true}) do |line|
        line << [next_id,trip_array[0][:origin_destination],trip_array[0][:start_date_of_trip],trip_array[0][:end_date_of_trip],trip_array[0][:destination]]
    end
end 