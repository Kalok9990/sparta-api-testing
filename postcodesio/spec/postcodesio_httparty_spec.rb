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

  it "should have a admin county that is a string or nil" do
    if @file.get_single_admin_county(a) == nil
      expect (@file.get_single_admin_county(a)).to be_nil
    else
      expect(@file.get_single_admin_county(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["admin_county"] == nil
        expect(postcode["result"]["admin_county"]).to be_nil
      else
        expect(postcode["result"]["admin_county"]).to be_kind_of(String)
      end
    end
  end

  it "should have a admin district that is a string or nil" do
    if @file.get_single_admin_district(a) == nil
      expect (@file.get_single_admin_district(a)).to be_nil
    else
      expect(@file.get_single_admin_district(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["admin_district"] == nil
        expect(postcode["result"]["admin_district"]).to be_nil
      else
        expect(postcode["result"]["admin_district"]).to be_kind_of(String)
      end
    end
  end

  it "should have a admin ward that is a string or nil" do
    if @file.get_single_admin_ward(a) == nil
      expect (@file.get_single_admin_ward(a)).to be_nil
    else
      expect(@file.get_single_admin_ward(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["admin_ward"] == nil
        expect(postcode["result"]["admin_ward"]).to be_nil
      else
        expect(postcode["result"]["admin_ward"]).to be_kind_of(String)
      end
    end
  end

  it "should have a longitude that is a float" do
    expect(@file.get_single_longitude(a)).to be_kind_of(Float)
    @file.get_postcodes_results(b).each do |postcode|
      expect(postcode["result"]["longitude"]).to be_kind_of(Float)
    end
  end

  it "should have a latitude that is a float" do
    expect(@file.get_single_longitude(a)).to be_kind_of(Float)
    @file.get_postcodes_results(b).each do |postcode|
      expect(postcode["result"]["latitude"]).to be_kind_of(Float)
    end
  end

  it "should have a parliamentary constituency that is a string or nil" do
    if @file.get_single_parliamentary_constituency(a) == nil
      expect (@file.get_single_parliamentary_constituency(a)).to be_nil
    else
      expect(@file.get_single_parliamentary_constituency(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["parliamentary_constituency"] == nil
        expect(postcode["result"]["parliamentary_constituency"]).to be_nil
      else
        expect(postcode["result"]["parliamentary_constituency"]).to be_kind_of(String)
      end
    end
  end

  it "should have a european electoral region that is a string or nil" do
    if @file.get_single_eer(a) == nil
      expect (@file.get_single_eer(a)).to be_nil
    else
      expect(@file.get_single_eer(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["european_electoral_region"] == nil
        expect(postcode["result"]["european_electoral_region"]).to be_nil
      else
        expect(postcode["result"]["european_electoral_region"]).to be_kind_of(String)
      end
    end
  end

  it "should have a primary care trust that is a string or nil" do
    if @file.get_single_pct(a) == nil
      expect (@file.get_single_pct(a)).to be_nil
    else
      expect(@file.get_single_pct(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["primary_care_trust"] == nil
        expect(postcode["result"]["primary_care_trust"]).to be_nil
      else
        expect(postcode["result"]["primary_care_trust"]).to be_kind_of(String)
      end
    end
  end

  it "should have a region that is a string or nil" do
    if @file.get_single_region(a) == nil
      expect (@file.get_single_region(a)).to be_nil
    else
      expect(@file.get_single_region(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["region"] == nil
        expect(postcode["result"]["region"]).to be_nil
      else
        expect(postcode["result"]["region"]).to be_kind_of(String)
      end
    end
  end

  it "should have a parish that is a string or nil" do
    if @file.get_single_parish(a) == nil
      expect (@file.get_single_parish(a)).to be_nil
    else
      expect(@file.get_single_parish(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["parish"] == nil
        expect(postcode["result"]["parish"]).to be_nil
      else
        expect(postcode["result"]["parish"]).to be_kind_of(String)
      end
    end
  end

  it "should have a lsoa that is a string or nil" do
    if @file.get_single_lsoa(a) == nil
      expect (@file.get_single_lsoa(a)).to be_nil
    else
      expect(@file.get_single_lsoa(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["lsoa"] == nil
        expect(postcode["result"]["lsoa"]).to be_nil
      else
        expect(postcode["result"]["lsoa"]).to be_kind_of(String)
      end
    end
  end

  it "should have a msoa that is a string or nil" do
    if @file.get_single_msoa(a) == nil
      expect (@file.get_single_msoa(a)).to be_nil
    else
      expect(@file.get_single_msoa(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["msoa"] == nil
        expect(postcode["result"]["msoa"]).to be_nil
      else
        expect(postcode["result"]["msoa"]).to be_kind_of(String)
      end
    end
  end

  it "should have a ccg that is a string or nil" do
    if @file.get_single_ccg(a) == nil
      expect (@file.get_single_ccg(a)).to be_nil
    else
      expect(@file.get_single_ccg(a)).to be_kind_of(String)
    end

    @file.get_postcodes_results(b).each do |postcode|
      if postcode["result"]["ccg"] == nil
        expect(postcode["result"]["ccg"]).to be_nil
      else
        expect(postcode["result"]["ccg"]).to be_kind_of(String)
      end
    end
  end

end
