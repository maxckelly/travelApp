require 'json'

module Countries
    def self.countries(json_file)
        return json_file["countries"].map do |country|
            country["country"]
        end
    end
end