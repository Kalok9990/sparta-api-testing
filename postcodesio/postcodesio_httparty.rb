require "httparty"
require "json"

class Postcodesio

  include HTTParty

  @postcode_array = []

  base_uri "https://api.postcodes.io"

  def get_single_postcode(postcode)
    JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes)
    JSON.parse(self.class.post("/postcodes", body:{"postcodes" => postcodes}).body)
  end

  def get_single_status(postcode)
    get_single_postcode(postcode)["status"]
  end

  def get_multiple_status(postcodes)
    get_multiple_postcodes(postcodes)["status"]
  end

  def get_postcode_result(postcode)
    get_single_postcode(postcode)["result"]
  end

  def get_postcodes_results(postcodes)
    get_multiple_postcodes(postcodes)["result"]
  end

  def get_postcode(postcode)
    get_postcode_result(postcode)["postcode"]
  end

  def get_single_quality(postcode)
    get_postcode_result(postcode)["quality"]
  end

  def get_single_eastings(postcode)
    get_postcode_result(postcode)["eastings"]
  end

  def get_single_northings(postcode)
    get_postcode_result(postcode)["northings"]
  end

  def get_single_country(postcode)
    get_postcode_result(postcode)["country"]
  end

  def get_single_nhs(postcode)
    get_postcode_result(postcode)["nhs_ha"]
  end

  def get_single_longitude(postcode)
    get_postcode_result(postcode)["longitude"]
  end

  def get_single_latitude(postcode)
    get_postcode_result(postcode)["latitude"]
  end

end

x=Postcodesio.new

# puts x.get_postcodes(["b601ja", "tq60nr", "ox27dr"])
# puts x.get_single_nhs("b601ja")
# puts x.get_multiple_postcodes(["b601ja", "tq60nr", "ox27dr"])["result"]
