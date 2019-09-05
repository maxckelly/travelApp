# files
require_relative 'countries_method'
require_relative 'travel_methods'
require_relative 'csv_methods'


def get_length_of_csv(file)
    read_file = File.read(file)
    return CSV.parse(read_file).length
end

def increment_id_test 
    # mock data
    data = [
        {
            origin_destination: "hshd",
            start_date_of_trip: "dhjskf",
            end_date_of_trip: "dhjksfh",
            destination: "hfjdhsk"
        }
    ]
    # setup, calling methods
    test_csv = 'test.csv'
    original_length = get_length_of_csv(test_csv)
    write_to_csv(data, test_csv)
    new_length = get_length_of_csv(test_csv)

    # test
    if original_length < new_length
        puts "Test passing!"
    else 
        puts "Test failing 😅"
    end 
end 

increment_id_test()


# def argv 
#     return argv_var = ARGV[0]
# end

# module Countries
#     def self.countries(json_file)
#         return json_file["countries"].map do |country|
#             country["country"]
#         end
#     end
# end

# def read_csv_to_increment_id 
#     file = File.read('itinerary.csv')
#     id = CSV.parse(file).last.first.to_i
#     return id + 1
# end

# def write_to_csv(trip_array)
#     next_id = read_csv_to_increment_id
#     CSV.open("itinerary.csv", "a+", {headers: true}) do |line|
#         line << [next_id,trip_array[0][:origin_destination],trip_array[0][:start_date_of_trip],trip_array[0][:end_date_of_trip],trip_array[0][:destination]]
#     end
# end 

# module Travel

#     def self.create_destinations(trip_array) 
#         destinations = trip_array.map do |trip|
#             trip[:destination]
#         end 
#         return destinations
#     end 

#     def self.individual_trips(trip_array)
#         individual_trip = trip_array.map do |trip|
#             "You are leaving #{trip[:origin_destination]} on the #{trip[:start_date_of_trip]} and arriving into #{trip[:destination]}. The end of your trip is on #{trip[:end_date_of_trip]}"
#         end
#         return individual_trip
#     end
# end  