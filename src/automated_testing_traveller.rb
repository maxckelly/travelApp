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
