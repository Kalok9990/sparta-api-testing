require 'spec_helper'

describe "Testing postcodesio" do

  before(:each) do
    @file = Postcodesio.new
  end

  a = "b601ja"
  b = ["b601ja", "tq60nr", "ox27dr"]

  it 'Should be a Hash' do
    expect(@file.get_single_postcode(a)).to be_kind_of(Hash)
    expect(@file.get_multiple_postcodes(b)).to be_kind_of(Hash)

  end

  it "should receive a status code of 200" do
    expect(@file.get_single_status(a)).to eq 200
    expect(@file.get_multiple_status(b)).to eq 200
  end

  it "should have a postcode that is a String and that it is 7-8 characters long" do
    expect(@file.get_postcode(a).length).to be_between(6, 8).inclusive
    expect(@file.get_postcode(a)).to be_kind_of(String)

    @file.get_postcodes_results(b).each do |postcode|
      expect(postcode["result"]["postcode"].length).to be_between(6, 8).inclusive
      expect(postcode["result"]).to be_kind_of(Hash)
    end
  end

  it "should have a position quality that is an integer from 1 to 9" do
    expect(@file.get_single_quality(a)).to be_between(1, 9).inclusive

    @file.get_postcodes_results(b).each do |postcode|
      expect(postcode["result"]["quality"]).to be_between(1, 9).inclusive
    end
  end

  it "should have eastings that is an integer" do
    if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
      expect(@file.get_single_eastings(a)).to be_nil
    else
      expect(@file.get_single_eastings(a)).to be_kind_of(Integer)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
        expect(postcode["result"]["eastings"]).to be_nil

      else
        expect(postcode["result"]["eastings"]).to be_kind_of(Integer)
      end
    end
  end

  it "should have northings that is an integer" do
    if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
      expect(@file.get_single_northings(a)).to be_nil
    else
      expect(@file.get_single_northings(a)).to be_kind_of(Integer)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
        expect(postcode["result"]["northings"]).to be_nil

      else
        expect(postcode["result"]["northings"]).to be_kind_of(Integer)
      end
    end
  end

  it "should have a country that is a string" do
    expect(@file.get_single_country(a)).to be_kind_of(String)
    @file.get_postcodes_results(b).each do |postcode|
      expect(postcode["result"]["country"]).to be_kind_of(String)
    end
  end

  it "should have a nhs-ha that is a string or nil" do
    if @file.get_single_nhs(a) == nil
      expect (@file.get_single_nhs(a)).to be_nil
    else
      expect(@file.get_single_nhs(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["nhs_na"] == nil
        expect(postcode["result"]["nhs_na"]).to be_nil
      else
        expect(postcode["result"]["nhs_na"]).to be_kind_of(String)
      end
    end
  end

end
