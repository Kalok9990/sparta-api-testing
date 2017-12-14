require "httparty"
require "json"

class MultiPostcodeService
  include HTTParty

  base_uri "https://api.postcodes.io"

  def get_multiple_postcodes(postcodes)
    JSON.parse(self.class.post("/postcodes", body:{"postcodes" => postcodes}).body)
  end
end

calls = MultiPostcodeService.new
# puts calls.get_multiple_postcodes(["b601ja", "tq60nr"])
