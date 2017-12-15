require "httparty"
require "json"

class MultiPostcodeService
  include HTTParty

  base_uri "https://api.postcodes.io"

  def get_multiple_postcodes(postcodes)
    @multiple_postcode_data = JSON.parse(self.class.post("/postcodes", body:{"postcodes" => postcodes}).body)
  end

  def get_multiple_status
    @multiple_postcode_data["status"]
  end

  def get_results
    @multiple_postcode_data
  end
  
  def get_postcodes_results
    @multiple_postcode_data["result"]
  end

  def get_postcodes_res_results(postcode)
    postcode["result"]
  end

  def get_postcodes(postcode)
    get_postcodes_res_results(postcode)["postcode"]
  end

  def get_postcodes_quality(postcode)
    get_postcodes_res_results(postcode)["quality"]
  end

  def get_postcodes_eastings(postcode)
    get_postcodes_res_results(postcode)["eastings"]
  end

  def get_postcodes_northings(postcode)
    get_postcodes_res_results(postcode)["northings"]
  end

  def get_postcodes_country(postcode)
    get_postcodes_res_results(postcode)["country"]
  end

  def get_postcodes_nhs(postcode)
    get_postcodes_res_results(postcode)["nhs_ha"]
  end

  def get_postcodes_admin_county(postcode)
    get_postcodes_res_results(postcode)["admin_county"]
  end

  def get_postcodes_admin_district(postcode)
    get_postcodes_res_results(postcode)["admin_district"]
  end

  def get_postcodes_admin_ward(postcode)
    get_postcodes_res_results(postcode)["admin_ward"]
  end

  def get_postcodes_longitude(postcode)
    get_postcodes_res_results(postcode)["longitude"]
  end

  def get_postcodes_latitude(postcode)
    get_postcodes_res_results(postcode)["latitude"]
  end

  def get_postcodes_parliamentary_constituency(postcode)
    get_postcodes_res_results(postcode)["parliamentary_constituency"]
  end

  def get_postcodes_eer(postcode)
    get_postcodes_res_results(postcode)["european_electoral_region"]
  end

  def get_postcodes_pct(postcode)
    get_postcodes_res_results(postcode)["primary_care_trust"]
  end

  def get_postcodes_region(postcode)
    get_postcodes_res_results(postcode)["region"]
  end

  def get_postcodes_parish(postcode)
    get_postcodes_res_results(postcode)["parish"]
  end

  def get_postcodes_lsoa(postcode)
    get_postcodes_res_results(postcode)["lsoa"]
  end

  def get_postcodes_msoa(postcode)
    get_postcodes_res_results(postcode)["msoa"]
  end

  def get_postcodes_ccg(postcode)
    get_postcodes_res_results(postcode)["ccg"]
  end

  def get_postcodes_nuts(postcode)
    get_postcodes_res_results(postcode)["nuts"]
  end

  def get_incodes(postcode)
    get_postcodes_res_results(postcode)["incode"]
  end

  def get_outcodes(postcode)
    get_postcodes_res_results(postcode)["outcode"]
  end

  def get_codes(postcode)
    get_postcodes_res_results(postcode)["codes"]
  end

  def get_codes_addistrict(postcode)
    get_codes(postcode)["admin_district"]
  end

  def get_codes_adcounty(postcode)
    get_codes(postcode)["admin_county"]
  end

  def get_codes_adward(postcode)
    get_codes(postcode)["admin_ward"]
  end

  def get_codes_parish(postcode)
    get_codes(postcode)["parish"]
  end

  def get_codes_parliamentary_constituency(postcode)
    get_codes(postcode)["parliamentary_constituency"]
  end

  def get_codes_ccg(postcode)
    get_codes(postcode)["ccg"]
  end

  def get_codes_nuts(postcode)
    get_codes(postcode)["nuts"]
  end
end

calls = MultiPostcodeService.new
# call = calls.get_multiple_postcodes(["b601ja", "tq60nr"])
