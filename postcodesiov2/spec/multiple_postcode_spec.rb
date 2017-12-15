require "spec_helper"

describe "Postcodesio" do

  context "requesting information on multiple postcodes works correctly" do

    before(:all) do
      @postcodesios = Postcodesio.new.multiple_postcode_service
      @postcodesios.get_multiple_postcodes(["b601ja", "tq60nr"])
    end

    it "should come out as a Hash" do
      expect(@postcodesios.get_results).to be_kind_of(Hash)
    end

    it "should receive a status code of 200" do
      expect(@postcodesios.get_multiple_status).to eq 200
    end

    it "should have a postcode that is a String and that it is 7-8 characters long" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes(postcode).length).to be_between(6, 8).inclusive
        expect(@postcodesios.get_postcodes_res_results(postcode)).to be_kind_of(Hash)
      end
    end

    it "should have a position quality that is an integer from 1 to 9" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes_quality(postcode)).to be_between(1, 9).inclusive
      end
    end

    it "should have eastings that is an integer" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes(postcode).include?("GY") || @postcodesios.get_postcodes(postcode).include?("IM")
          expect(@postcodesios.get_postcodes_eastings(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_eastings(postcode)).to be_kind_of(Integer)
        end
      end
    end

    it "should have northings that is an integer" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes(postcode).include?("GY") || @postcodesios.get_postcodes(postcode).include?("IM")
          expect(@postcodesios.get_postcodes_northings(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_northings(postcode)).to be_kind_of(Integer)
        end
      end
    end

    it "should have a country that is a string" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes_country(postcode)).to be_kind_of(String)
      end
    end

    it "should have a nhs-ha that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
          expect(@postcodesios.get_postcodes_nhs(postcode)).to be_kind_of(String).or be_nil
      end
    end

    it "should have a admin county that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
          expect(@postcodesios.get_postcodes_admin_county(postcode)).to be_kind_of(String).or be_nil
      end
    end

    it "should have a admin district that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
          expect(@postcodesios.get_postcodes_admin_district(postcode)).to be_kind_of(String).or be_nil
      end
    end

    it "should have a admin ward that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
          expect(@postcodesios.get_postcodes_admin_ward(postcode)).to be_kind_of(String).or be_nil
      end
    end

    it "should have a longitude that is a float" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes_longitude(postcode)).to be_kind_of(Float)
      end
    end

    it "should have a latitude that is a float" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes_latitude(postcode)).to be_kind_of(Float)
      end
    end

    it "should have a parliamentary constituency that is a string or nil for mulitple postcodes" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_parliamentary_constituency(postcode) == nil
          expect(@postcodesios.get_postcodes_parliamentary_constituency(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_parliamentary_constituency(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a european electoral region that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_eer(postcode) == nil
          expect(@postcodesios.get_postcodes_eer(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_eer(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a primary care trust that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_pct(postcode) == nil
          expect(@postcodesios.get_postcodes_pct(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_pct(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a region that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_region(postcode) == nil
          expect(@postcodesios.get_postcodes_region(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_region(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a parish that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_parish(postcode) == nil
          expect(@postcodesios.get_postcodes_parish(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_parish(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a lsoa that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_lsoa(postcode) == nil
          expect(@postcodesios.get_postcodes_lsoa(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_lsoa(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a msoa that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_msoa(postcode) == nil
          expect(@postcodesios.get_postcodes_msoa(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_msoa(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a ccg that is a string or nil" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_ccg(postcode) == nil
          expect(@postcodesios.get_postcodes_ccg(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_ccg(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a nuts that is a string or nil for mulitple postcodes" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_postcodes_nuts(postcode) == nil
          expect(@postcodesios.get_postcodes_nuts(postcode)).to be_nil
        else
          expect(@postcodesios.get_postcodes_nuts(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have an incode" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes(postcode)).to include(@postcodesios.get_incodes(postcode))
      end
    end

    it "should have an outcode" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_postcodes(postcode)).to include(@postcodesios.get_outcodes(postcode))
      end
    end

    it "should have codes section as a Hash" do
      @postcodesios.get_postcodes_results.each do |postcode|
        expect(@postcodesios.get_codes(postcode)).to be_kind_of(Hash)
      end
    end

    it "should have an admin_district in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_addistrict(postcode) == nil
          expect(@postcodesios.get_codes_addistrict(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_addistrict(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have an admin_county in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_adcounty(postcode) == nil
          expect(@postcodesios.get_codes_adcounty(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_adcounty(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have an admin_ward in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_adward(postcode) == nil
          expect(@postcodesios.get_codes_adward(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_adward(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a parish in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_parish(postcode) == nil
          expect(@postcodesios.get_codes_parish(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_parish(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a parliamentary_constituency in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_parliamentary_constituency(postcode) == nil
          expect(@postcodesios.get_codes_parliamentary_constituency(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_parliamentary_constituency(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a ccg in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_ccg(postcode) == nil
          expect(@postcodesios.get_codes_ccg(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_ccg(postcode)).to be_kind_of(String)
        end
      end
    end

    it "should have a nuts in codes as a String" do
      @postcodesios.get_postcodes_results.each do |postcode|
        if @postcodesios.get_codes_nuts(postcode) == nil
          expect(@postcodesios.get_codes_nuts(postcode)).to be_nil
        else
          expect(@postcodesios.get_codes_nuts(postcode)).to be_kind_of(String)
        end
      end
    end
  end
end
