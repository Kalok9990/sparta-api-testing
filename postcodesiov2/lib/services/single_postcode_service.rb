require "httparty"
require "json"

class SinglePostcodeService
  include HTTParty

  attr_accessor :single_postcode_data

  base_uri "https://api.postcodes.io"

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_result
    @single_postcode_data["result"]
  end

  def get_status_code_from_body_response
    @single_postcode_data["status"]
  end



end

call = SinglePostcodeService.new
# puts call.get_single_postcode("b601ja")
