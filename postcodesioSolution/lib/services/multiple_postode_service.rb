require 'httparty'
require 'json'

class MultiplePostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_multiple_postcodes(postcodes_array)
    @multiple_postcode_data = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def print_results
    puts @multiple_postcode_data
  end

  def get_status_code_from_body_response
    @multiple_postcode_data['status']
  end

  def get_result
    @multiple_postcode_data['result']
  end

  def get_postcodes_queries
    total_queries = []
    get_result.each{|result| total_queries << result['query'] }
    total_queries
  end

  def get_total_postcode_queries
    get_postcodes_query.length
  end

  def get_all_postcodes
    postcodes = []
    get_result.each do |result|
      postcodes << result['result']['postcode'].gsub(' ','')
    end
    postcodes
  end

  def get_all_quality_results
    quality = []
    get_result.each do |result|
      quality << result['result']['quality']
    end
    quality
  end

  def get_all_eastings_results
    eastings = []
    get_result.each do |result|
      eastings << result['result']['eastings']
    end
    eastings
  end

  def get_all_country_results
    country = []
    get_result.each do |result|
      country << result['result']['country']
    end
    country
  end

  def get_all_nhs_results
    nhs = []
    get_result.each do |result|
      nhs << result['result']['nhs_ha']
    end
    nhs
  end

  def get_all_longitude_results
    longitude = []
    get_result.each do |result|
      longitude << result['result']['longitude']
    end
    longitude
  end

  def get_all_latitude_results
    latitude = []
    get_result.each do |result|
      latitude << result['result']['latitude']
    end
    latitude
  end

  def get_all_parliamentary_constituency_results
    parliamentary_constituency = []
    get_result.each do |result|
      parliamentary_constituency << result['result']['parliamentary_constituency']
    end
    parliamentary_constituency
  end

  def get_all_european_electoral_region_results
    european_electoral_region = []
    get_result.each do |result|
      european_electoral_region << result['result']['european_electoral_region']
    end
    european_electoral_region
  end

  def get_all_primary_care_trust_results
    primary_care_trust = []
    get_result.each do |result|
      primary_care_trust << result['result']['primary_care_trust']
    end
    primary_care_trust
  end

  def get_all_region_results
    region = []
    get_result.each do |result|
      region << result['result']['region']
    end
    region
  end

  def get_all_parish_results
    parish = []
    get_result.each do |result|
      parish << result['result']['parish']
    end
    parish
  end

  def get_all_lsoa_results
    lsoa = []
    get_result.each do |result|
      lsoa << result['result']['lsoa']
    end
    lsoa
  end

  def get_all_msoa_results
    msoa = []
    get_result.each do |result|
      msoa << result['result']['msoa']
    end
    msoa
  end

  def get_all_admin_district_results
    admin_district = []
    get_result.each do |result|
      admin_district << result['result']['admin_district']
    end
    admin_district
  end

  def get_all_incode_results
    incode = []
    get_result.each do |result|
      incode << result['result']['incode']
    end
    incode
  end

  def get_all_outcode_results
    outcode = []
    get_result.each do |result|
      outcode << result['result']['outcode']
    end
    outcode
  end

end
