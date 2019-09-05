require 'csv'
require 'pry'

def read_csv_to_increment_id(file) 
    read_file = File.read(file)
    id = CSV.parse(read_file).last.first.to_i
    return id + 1
end

def write_to_csv(trip_array, file)
    next_id = read_csv_to_increment_id(file)
    CSV.open(file, "a+", {headers: true}) do |line|
        line << [next_id,trip_array[0][:origin_destination],trip_array[0][:start_date_of_trip],trip_array[0][:end_date_of_trip],trip_array[0][:destination]]
    end
end 