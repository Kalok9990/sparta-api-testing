require 'httparty'
require 'json'

class SinglePostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def print_results
    puts @single_postcode_data
  end

  def get_status_code_from_body_response
    @single_postcode_data['status']
  end

  def get_result
    @single_postcode_data['result']
  end

  def get_response_postcode
    get_result['postcode']
  end

  def get_response_postcode_length
    get_response_postcode.gsub(' ','').length
  end

  def get_response_quality
    get_result['quality']
  end

  def get_response_eastings
    get_result['eastings']
  end

  def get_response_northings
    get_result['northings']
  end

  def get_response_country
    get_result['country']
  end

  def get_response_nhs_authority
    get_result['nhs_ha']
  end

  def get_response_longitude
    get_result['longitude']
  end

  def get_response_latitude
    get_result['latitude']
  end

  def get_response_european_electoral_region
    get_result['european_electoral_region']
  end

  def get_response_primary_care_trust
    get_result['primary_care_trust']
  end

  def get_response_region
    get_result['region']
  end

  def get_response_lsoa
    get_result['lsoa']
  end

  def get_response_msoa
    get_result['msoa']
  end

  def get_response_incode
    get_result['incode']
  end

  def get_response_outcode
    get_result['outcode']
  end

  def get_response_parl_constituency
    get_result['parliamentary_constituency']
  end

  def get_response_admin_district
    get_result['admin_district']
  end

  def get_response_parish
    get_result['parish']
  end

  def get_response_admin_county
    get_result['admin_county']
  end

  def get_response_admin_ward
    get_result['admin_ward']
  end

  def get_response_ccg
    get_result['ccg']
  end

  def get_response_nuts
    get_result['nuts']
  end


  def get_response_codes
    get_result['codes']
  end

  def get_response_codes_admin_district
    get_response_codes['admin_district']
  end

  def get_response_codes_admin_county
    get_response_codes['admin_county']
  end

  def get_response_codes_admin_ward
    get_response_codes['admin_ward']
  end

  def get_response_codes_parish
    get_response_codes['parish']
  end

  def get_response_codes_parliamentary_constituency
    get_response_codes['parliamentary_constituency']
  end

  def get_response_codes_ccg
    get_response_codes['ccg']
  end

  def get_response_codes_nuts
    get_response_codes['nuts']
  end

end
