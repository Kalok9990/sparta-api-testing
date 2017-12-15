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

  def get_postcodes_res_results(postcode)
    postcode["result"]
  end

  def get_postcodes(postcode)
    get_postcodes_res_results(postcode)["postcode"]
  end


  def get_single_quality(postcode)
    get_postcode_result(postcode)["quality"]
  end

  def get_postcodes_quality(postcode)
    get_postcodes_res_results(postcode)["quality"]
  end

  def get_single_eastings(postcode)
    get_postcode_result(postcode)["eastings"]
  end

  def get_postcodes_eastings(postcode)
    get_postcodes_res_results(postcode)["eastings"]
  end

  def get_single_northings(postcode)
    get_postcode_result(postcode)["northings"]
  end

  def get_postcodes_northings(postcode)
    get_postcodes_res_results(postcode)["northings"]
  end

  def get_single_country(postcode)
    get_postcode_result(postcode)["country"]
  end

  def get_postcodes_country(postcode)
    get_postcodes_res_results(postcode)["country"]
  end

  def get_single_nhs(postcode)
    get_postcode_result(postcode)["nhs_ha"]
  end

  def get_postcodes_nhs(postcode)
    get_postcodes_res_results(postcode)["nhs_ha"]
  end

  def get_single_admin_county(postcode)
    get_postcode_result(postcode)["admin_county"]
  end

  def get_postcodes_admin_county(postcode)
    get_postcodes_res_results(postcode)["admin_county"]
  end

  def get_single_admin_district(postcode)
    get_postcode_result(postcode)["admin_district"]
  end

  def get_postcodes_admin_district(postcode)
    get_postcodes_res_results(postcode)["admin_district"]
  end

  def get_single_admin_ward(postcode)
    get_postcode_result(postcode)["admin_ward"]
  end

  def get_postcodes_admin_ward(postcode)
    get_postcodes_res_results(postcode)["admin_ward"]
  end

  def get_single_longitude(postcode)
    get_postcode_result(postcode)["longitude"]
  end

  def get_postcodes_longitude(postcode)
    get_postcodes_res_results(postcode)["longitude"]
  end

  def get_single_latitude(postcode)
    get_postcode_result(postcode)["latitude"]
  end

  def get_postcodes_latitude(postcode)
    get_postcodes_res_results(postcode)["latitude"]
  end

  def get_single_parliamentary_constituency(postcode)
    get_postcode_result(postcode)["parliamentary_constituency"]
  end

  def get_postcodes_parliamentary_constituency(postcode)
    get_postcodes_res_results(postcode)["parliamentary_constituency"]
  end

  def get_single_eer(postcode)
    get_postcode_result(postcode)["european_electoral_region"]
  end

  def get_postcodes_eer(postcode)
    get_postcodes_res_results(postcode)["european_electoral_region"]
  end

  def get_single_pct(postcode)
    get_postcode_result(postcode)["primary_care_trust"]
  end

  def get_postcodes_pct(postcode)
    get_postcodes_res_results(postcode)["primary_care_trust"]
  end

  def get_single_region(postcode)
    get_postcode_result(postcode)["region"]
  end

  def get_postcodes_region(postcode)
    get_postcodes_res_results(postcode)["region"]
  end

  def get_single_parish(postcode)
    get_postcode_result(postcode)["parish"]
  end

  def get_postcodes_parish(postcode)
    get_postcodes_res_results(postcode)["parish"]
  end

  def get_single_lsoa(postcode)
    get_postcode_result(postcode)["lsoa"]
  end

  def get_postcodes_lsoa(postcode)
    get_postcodes_res_results(postcode)["lsoa"]
  end

  def get_single_msoa(postcode)
    get_postcode_result(postcode)["msoa"]
  end

  def get_postcodes_msoa(postcode)
    get_postcodes_res_results(postcode)["msoa"]
  end

  def get_single_ccg(postcode)
    get_postcode_result(postcode)["ccg"]
  end

  def get_postcodes_ccg(postcode)
    get_postcodes_res_results(postcode)["ccg"]
  end

  def get_single_nuts(postcode)
    get_postcode_result(postcode)["nuts"]
  end

  def get_postcodes_nuts(postcode)
    get_postcodes_res_results(postcode)["nuts"]
  end

  def get_incode(postcode)
    get_postcode_result(postcode)["incode"]
  end

  def get_incodes(postcode)
    get_postcodes_res_results(postcode)["incode"]
  end

  def get_outcode(postcode)
    get_postcode_result(postcode)["outcode"]
  end

  def get_outcodes(postcode)
    get_postcodes_res_results(postcode)["outcode"]
  end

  def get_code(postcode)
    get_postcode_result(postcode)["codes"]
  end

  def get_codes(postcode)
    get_postcodes_res_results(postcode)["codes"]
  end

  def get_code_addistrict(postcode)
    get_code(postcode)["admin_district"]
  end

  def get_codes_addistrict(postcode)
    get_codes(postcode)["admin_district"]
  end

  def get_code_adcounty(postcode)
    get_code(postcode)["admin_county"]
  end

  def get_codes_adcounty(postcode)
    get_codes(postcode)["admin_county"]
  end

  def get_code_adward(postcode)
    get_code(postcode)["admin_ward"]
  end

  def get_codes_adward(postcode)
    get_codes(postcode)["admin_ward"]
  end

  def get_code_parish(postcode)
    get_code(postcode)["parish"]
  end

  def get_codes_parish(postcode)
    get_codes(postcode)["parish"]
  end

  def get_code_parliamentary_constituency(postcode)
    get_code(postcode)["parliamentary_constituency"]
  end

  def get_codes_parliamentary_constituency(postcode)
    get_codes(postcode)["parliamentary_constituency"]
  end

  def get_code_ccg(postcode)
    get_code(postcode)["ccg"]
  end

  def get_codes_ccg(postcode)
    get_codes(postcode)["ccg"]
  end

  def get_code_nuts(postcode)
    get_code(postcode)["nuts"]
  end

  def get_codes_nuts(postcode)
    get_codes(postcode)["nuts"]
  end

end

x=Postcodesio.new

# puts x.get_postcodes(["b601ja", "tq60nr", "ox27dr"])
# puts x.get_single_nhs("b601ja")
# puts x.get_multiple_postcodes(["b601ja", "tq60nr", "ox27dr"])["result"]
