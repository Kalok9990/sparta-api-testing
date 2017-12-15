require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new.single_postcode_service
      @postcodesio.get_single_postcode('se96rj')

    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status_code_from_body_response).to eq 200
    end

    it "should have a results hash" do
      expect(@postcodesio.get_result).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_response_postcode_length).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_response_quality).to be_kind_of(Integer)
      expect(@postcodesio.get_response_quality).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_response_eastings).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@postcodesio.get_response_northings).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_response_country).to match("England").and match("Scotland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_response_nhs_authority).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_response_longitude).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_response_latitude).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_response_parl_constituency).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_response_european_electoral_region).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_response_primary_care_trust).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.get_response_region).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.get_response_parish).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_response_lsoa).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_response_msoa).to be_kind_of(String)
    end

    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_response_admin_district).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_response_incode).to be_kind_of(String)
      expect(@postcodesio.get_response_incode.length).to eq 3
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_response_msoa).to be_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.get_response_outcode).to be_kind_of(String)
      expect(@postcodesio.get_response_outcode.length).to be_between(3,4)
    end
  end
end
