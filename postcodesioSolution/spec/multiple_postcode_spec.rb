require 'spec_helper'

describe Postcodesio do

  before(:all) do
    @postcodes_array = ['SE3 8PF', 'SE9 6RJ']
    @postcodesio = Postcodesio.new.multiple_postcodes_service
    @postcodesio.get_multiple_postcodes(@postcodes_array)
  end

  it "should respond with a status message of 200" do
    expect(@postcodesio.get_status_code_from_body_response).to eq 200
  end

  it "should return the first query as the first postcode in the response" do
    expect(@postcodesio.get_postcodes_queries[0]).to eq @postcodes_array[0]
  end

  it "should return the second query as the second postcode in the response" do
    expect(@postcodesio.get_postcodes_queries[1]).to eq @postcodes_array[1]
  end

  it "should have a results hash" do
    @postcodesio.get_result.each do |results|
      expect(results).to be_kind_of(Hash)
    end
  end

  it "should return a postcode between 5-7 in length"  do
    @postcodesio.get_all_postcodes.each do |postcode|
      expect(postcode.length).to be_between(5,7)
    end
  end

  it "should return an quality key integer between 1-9" do
    @postcodesio.get_all_quality_results.each do |quality|
      expect(quality).to be_kind_of(Integer)
      expect(quality).to be_between(1,9)
    end
  end

  it "should return an ordnance survey eastings value as integer" do
    @postcodesio.get_all_eastings_results.each do |eastings|
      expect(eastings).to be_kind_of(Integer)
    end
  end

  it "should return a country which is one of the four constituent countries of the UK" do
    @postcodesio.get_all_country_results.each do |country|
      expect(country).to eq("England")
    end
  end

  it "should return a string value for NHS authority " do
    @postcodesio.get_all_nhs_results.each do |nhs|
      expect(nhs).to be_kind_of(String)
    end
  end

  it "should return a longitude float value" do
    @postcodesio.get_all_longitude_results.each do |long|
      expect(long).to be_kind_of(Float)
    end
  end

  it "should return a latitude float value" do
    @postcodesio.get_all_latitude_results.each do |lat|
      expect(lat).to be_kind_of(Float)
    end
  end

  it "should return a parliamentary constituency string" do
    @postcodesio.get_all_parliamentary_constituency_results.each do |parl|
      expect(parl).to be_kind_of(String)
    end
  end

  it "should return a european_electoral_region string" do
    @postcodesio.get_all_european_electoral_region_results.each do |eur|
      expect(eur).to be_kind_of(String)
    end
  end

  it "should return a primary_care_trust string" do
    @postcodesio.get_all_primary_care_trust_results.each do |care|
      expect(care).to be_kind_of(String)
    end
  end

  it "should return a region string" do
    @postcodesio.get_all_region_results.each do |region|
      expect(region).to be_kind_of(String)
    end
  end

  it "should return a parish string" do
    @postcodesio.get_all_parish_results.each do |par|
      expect(par).to be_kind_of(String)
    end
  end

  it "should return a lsoa string" do
    @postcodesio.get_all_lsoa_results.each do |lsoa|
      expect(lsoa).to be_kind_of(String)
    end
  end

  it "should return a msoa string" do
    @postcodesio.get_all_msoa_results.each do |msoa|
      expect(msoa).to be_kind_of(String)
    end
  end
  # admin ward and county are not documented however tested below

  it "should return a admin_district string" do
    @postcodesio.get_all_admin_district_results.each do |admin|
      expect(admin).to be_kind_of(String)
    end
  end

  it "should return a incode string of three characters" do
    @postcodesio.get_all_incode_results.each do |incode|
      expect(incode).to be_kind_of(String)
      expect(incode.length).to eq 3
    end
  end

  it "should return a outcode string of between 3-4 characters" do
    @postcodesio.get_all_outcode_results.each do |outcode|
      expect(outcode).to be_kind_of(String)
      expect(outcode.length).to be_between(3,4)
    end
  end


end