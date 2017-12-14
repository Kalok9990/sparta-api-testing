require 'spec_helper'

describe "Testing postcodesio" do

  before(:each) do
    @file = Postcodesio.new
  end

  a = "b601ja"
  b = ["b601ja", "tq60nr", "ox27dr"]

  it 'Should be a Hash for single postcode' do
    expect(@file.get_single_postcode(a)).to be_kind_of(Hash)
  end

  it "should come out as a Hash with multiple postcodes" do
    expect(@file.get_multiple_postcodes(b)).to be_kind_of(Hash)
  end

  it "should receive a status code of 200 for single postcode" do
    expect(@file.get_single_status(a)).to eq 200
  end

  it "should receive a status code of 200 for multiple postcodes" do
    expect(@file.get_multiple_status(b)).to eq 200
  end

  it "should have a postcode that is a String and that it is 7-8 characters long for single postcode" do
    expect(@file.get_postcode(a).length).to be_between(6, 8).inclusive
    expect(@file.get_postcode(a)).to be_kind_of(String)
  end

  it "should have a postcode that is a String and that it is 7-8 characters long for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes(postcode).length).to be_between(6, 8).inclusive
      expect(@file.get_postcodes_res_results(postcode)).to be_kind_of(Hash)
    end
  end

  it "should have a position quality that is an integer from 1 to 9 for single postcode" do
    expect(@file.get_single_quality(a)).to be_between(1, 9).inclusive
  end

  it "should have a position quality that is an integer from 1 to 9 for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes_quality(postcode)).to be_between(1, 9).inclusive
    end
  end

  it "should have eastings that is an integer for single postcode" do
    if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
      expect(@file.get_single_eastings(a)).to be_nil
    else
      expect(@file.get_single_eastings(a)).to be_kind_of(Integer)
    end
  end

  it "should have eastings that is an integer for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
        expect(@file.get_postcodes_eastings(postcode)).to be_nil
      else
        expect(@file.get_postcodes_eastings(postcode)).to be_kind_of(Integer)
      end
    end
  end

  it "should have northings that is an integer for single postcode" do
    if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
      expect(@file.get_single_northings(a)).to be_nil
    else
      expect(@file.get_single_northings(a)).to be_kind_of(Integer)
    end
  end

  it "should have northings that is an integer for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcode(a).include?("GY") || @file.get_postcode(a).include?("IM")
        expect(@file.get_postcodes_northings(postcode)).to be_nil
      else
        expect(@file.get_postcodes_northings(postcode)).to be_kind_of(Integer)
      end
    end
  end

  it "should have a country that is a string for a single postcode" do
    expect(@file.get_single_country(a)).to be_kind_of(String)
  end

  it "should have a country that is a string for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes_country(postcode)).to be_kind_of(String)
    end
  end

  it "should have a nhs-ha that is a string or nil for a single postcode" do
    if @file.get_single_nhs(a) == nil
      expect (@file.get_single_nhs(a)).to be_nil
    else
      expect(@file.get_single_nhs(a)).to be_kind_of(String)
    end
  end

  it "should have a nhs-ha that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_nhs(postcode) == nil
        expect(@file.get_postcodes_nhs(postcode)).to be_nil
      else
        expect(@file.get_postcodes_nhs(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a admin county that is a string or nil for single postcode" do
    if @file.get_single_admin_county(a) == nil
      expect (@file.get_single_admin_county(a)).to be_nil
    else
      expect(@file.get_single_admin_county(a)).to be_kind_of(String)
    end
  end

  it "should have a admin county that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_admin_county(postcode) == nil
        expect(@file.get_postcodes_admin_county(postcode)).to be_nil
      else
        expect(@file.get_postcodes_admin_county(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a admin district that is a string or nil for a single postcode" do
    if @file.get_single_admin_district(a) == nil
      expect (@file.get_single_admin_district(a)).to be_nil
    else
      expect(@file.get_single_admin_district(a)).to be_kind_of(String)
    end
  end

  it "should have a admin district that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_admin_district(postcode) == nil
        expect(@file.get_postcodes_admin_district(postcode)).to be_nil
      else
        expect(@file.get_postcodes_admin_district(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a admin ward that is a string or nil for single postcode" do
    if @file.get_single_admin_ward(a) == nil
      expect (@file.get_single_admin_ward(a)).to be_nil
    else
      expect(@file.get_single_admin_ward(a)).to be_kind_of(String)
    end
  end

  it "should have a admin ward that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_admin_ward(postcode) == nil
        expect(@file.get_postcodes_admin_ward(postcode)).to be_nil
      else
        expect(@file.get_postcodes_admin_ward(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a longitude that is a float for single postcode" do
    expect(@file.get_single_longitude(a)).to be_kind_of(Float)
  end

  it "should have a longitude that is a float for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes_longitude(postcode)).to be_kind_of(Float)
    end
  end

  it "should have a latitude that is a float for single postcode" do
    expect(@file.get_single_longitude(a)).to be_kind_of(Float)
  end

  it "should have a latitude that is a float for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes_latitude(postcode)).to be_kind_of(Float)
    end
  end

  it "should have a parliamentary constituency that is a string or nil for single postcode" do
    if @file.get_single_parliamentary_constituency(a) == nil
      expect (@file.get_single_parliamentary_constituency(a)).to be_nil
    else
      expect(@file.get_single_parliamentary_constituency(a)).to be_kind_of(String)
    end
  end

  it "should have a parliamentary constituency that is a string or nil for mulitple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_parliamentary_constituency(postcode) == nil
        expect(@file.get_postcodes_parliamentary_constituency(postcode)).to be_nil
      else
        expect(@file.get_postcodes_parliamentary_constituency(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a european electoral region that is a string or nil for single postcode" do
    if @file.get_single_eer(a) == nil
      expect (@file.get_single_eer(a)).to be_nil
    else
      expect(@file.get_single_eer(a)).to be_kind_of(String)
    end
  end

  it "should have a european electoral region that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_eer(postcode) == nil
        expect(@file.get_postcodes_eer(postcode)).to be_nil
      else
        expect(@file.get_postcodes_eer(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a primary care trust that is a string or nil for single postcode" do
    if @file.get_single_pct(a) == nil
      expect (@file.get_single_pct(a)).to be_nil
    else
      expect(@file.get_single_pct(a)).to be_kind_of(String)
    end
  end

  it "should have a primary care trust that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_pct(postcode) == nil
        expect(@file.get_postcodes_pct(postcode)).to be_nil
      else
        expect(@file.get_postcodes_pct(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a region that is a string or nil for single postcode" do
    if @file.get_single_region(a) == nil
      expect (@file.get_single_region(a)).to be_nil
    else
      expect(@file.get_single_region(a)).to be_kind_of(String)
    end
  end

  it "should have a region that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_region(postcode) == nil
        expect(@file.get_postcodes_region(postcode)).to be_nil
      else
        expect(@file.get_postcodes_region(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a parish that is a string or nil for single postcode" do
    if @file.get_single_parish(a) == nil
      expect (@file.get_single_parish(a)).to be_nil
    else
      expect(@file.get_single_parish(a)).to be_kind_of(String)
    end
  end

  it "should have a parish that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_parish(postcode) == nil
        expect(@file.get_postcodes_parish(postcode)).to be_nil
      else
        expect(@file.get_postcodes_parish(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a lsoa that is a string or nil for single postcode" do
    if @file.get_single_lsoa(a) == nil
      expect (@file.get_single_lsoa(a)).to be_nil
    else
      expect(@file.get_single_lsoa(a)).to be_kind_of(String)
    end
  end

  it "should have a lsoa that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_lsoa(postcode) == nil
        expect(@file.get_postcodes_lsoa(postcode)).to be_nil
      else
        expect(@file.get_postcodes_lsoa(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a msoa that is a string or nil for single postcode" do
    if @file.get_single_msoa(a) == nil
      expect (@file.get_single_msoa(a)).to be_nil
    else
      expect(@file.get_single_msoa(a)).to be_kind_of(String)
    end
  end

  it "should have a msoa that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_msoa(postcode) == nil
        expect(@file.get_postcodes_msoa(postcode)).to be_nil
      else
        expect(@file.get_postcodes_msoa(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a ccg that is a string or nil for single postcode" do
    if @file.get_single_ccg(a) == nil
      expect (@file.get_single_ccg(a)).to be_nil
    else
      expect(@file.get_single_ccg(a)).to be_kind_of(String)
    end
  end

  it "should have a ccg that is a string or nil for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_ccg(postcode) == nil
        expect(@file.get_postcodes_ccg(postcode)).to be_nil
      else
        expect(@file.get_postcodes_ccg(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have a nuts that is a string or nil for single postcode" do
    if @file.get_single_nuts(a) == nil
      expect (@file.get_single_nuts(a)).to be_nil
    else
      expect(@file.get_single_nuts(a)).to be_kind_of(String)
    end
  end

  it "should have a nuts that is a string or nil for mulitple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      if @file.get_postcodes_nuts(postcode) == nil
        expect(@file.get_postcodes_nuts(postcode)).to be_nil
      else
        expect(@file.get_postcodes_nuts(postcode)).to be_kind_of(String)
      end
    end
  end

  it "should have an incode for single postcode" do
    expect(@file.get_postcode(a)).to include(@file.get_incode(a))
  end

  it "should have an incode for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes(postcode)).to include(@file.get_incodes(postcode))
    end
  end

  it "should have an outcode for single postcode" do
    expect(@file.get_postcode(a)).to include(@file.get_outcode(a))
  end

  it "should have an outcode for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_postcodes(postcode)).to include(@file.get_outcodes(postcode))
    end
  end

  it "should have codes section as a Hash for single postcode" do
    expect(@file.get_code(a)).to be_kind_of(Hash)
  end

  it "should have codes section as a Hash for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes(postcode)).to be_kind_of(Hash)
    end
  end

  it "should have an admin_district in codes as a String for single postcode" do
    expect(@file.get_code_addistrict(a)).to be_kind_of(String)
  end

  it "should have an admin_district in codes as a String for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_addistrict(postcode)).to be_kind_of(String)
    end
  end

  it "should have an admin_county in codes as a String for single postcode" do
    expect(@file.get_code_adcounty(a)).to be_kind_of(String)
  end

  it "should have an admin_county in codes as a String for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_adcounty(postcode)).to be_kind_of(String)
    end
  end

  it "should have an admin_ward in codes as a String for single postcode" do
    expect(@file.get_code_adward(a)).to be_kind_of(String)
  end

  it "should have an admin_ward in codes as a String for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_adward(postcode)).to be_kind_of(String)
    end
  end

  it "should have a parish in codes as a String for single postcode" do
    expect(@file.get_code_parish(a)).to be_kind_of(String)
  end

  it "should have a parish in codes as a String for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_parish(postcode)).to be_kind_of(String)
    end
  end

  it "should have a parliamentary_constituency in codes as a String for single postcode" do
    expect(@file.get_code_parliamentary_constituency(a)).to be_kind_of(String)
  end

  it "should have a parliamentary_constituency in codes as a String for single postcode for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_parliamentary_constituency(postcode)).to be_kind_of(String)
    end
  end

  it "should have a ccg in codes as a String for single postcode" do
    expect(@file.get_code_ccg(a)).to be_kind_of(String)
  end

  it "should have a ccg in codes as a String for single postcode for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_ccg(postcode)).to be_kind_of(String)
    end
  end

  it "should have a nuts in codes as a String for single postcode" do
    expect(@file.get_code_nuts(a)).to be_kind_of(String)
  end

  it "should have a nuts in codes as a String for single postcode for multiple postcodes" do
    @file.get_postcodes_results(b).each do |postcode|
      expect(@file.get_codes_nuts(postcode)).to be_kind_of(String)
    end
  end
end
