require 'json'

file = File.open "countries.json" # Loads the the countries.json file
data = JSON.load file # Opens the countries.json file

module Countries
    def self.countries(json_file)
        return json_file["countries"].map do |country|
            country["country"]
        end
    end
end