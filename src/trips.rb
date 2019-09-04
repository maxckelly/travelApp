class Trips

    attr_accessor :origin_destination, :start_date_of_trip, :end_date_of_trip, :destination

    def initialize(array)
        @origin_destination = array[0]
        @start_date_of_trip = array[1]
        @end_date_of_trip = array[2]
        @destination = array[3]
    end
end
