require "spec_helper"

describe "Postcodesio" do

  context "requesting information on a single postcode works correctly" do

    before(:all) do
      @postcodesio = Postcodesio.new.single_postcode_service
      @postcodesio.get_single_postcode("se96rj")
    end

    it "should respond with a status code of 200" do
      expect(@postcodesio.get_status_code_from_body_response).to eq 200
    end

    it "should respond as a Hash" do
      expect(@postcodesio.get_result).to be_kind_of(Hash)
    end

    it "should have a postcode that is a String and that it is 7-8 characters long" do
      expect(@postcodesio.get_postcode.length).to be_between(6, 8).inclusive
      expect(@postcodesio.get_postcode).to be_kind_of(String)
    end

    it "should have a position quality that is an integer from 1 to 9" do
      expect(@postcodesio.get_single_quality).to be_between(1, 9).inclusive
    end

    it "should have eastings that is an integer" do
      if @postcodesio.get_postcode.include?("GY") || @postcodesio.get_postcode.include?("IM")
        expect(@postcodesio.get_single_eastings).to be_nil
      else
        expect(@postcodesio.get_single_eastings).to be_kind_of(Integer)
      end
    end

    it "should have northings that is an integer" do
      if @postcodesio.get_postcode.include?("GY") || @postcodesio.get_postcode.include?("IM")
        expect(@postcodesio.get_single_northings).to be_nil
      else
        expect(@postcodesio.get_single_northings).to be_kind_of(Integer)
      end
    end

    it "should have a country that is a string for a single postcode" do
      expect(@postcodesio.get_single_country).to be_kind_of(String)
    end

    it "should have a nhs-ha that is a string or nil for a single postcode" do
      if @postcodesio.get_single_nhs == nil
        expect (@postcodesio.get_single_nhs).to be_nil
      else
        expect(@postcodesio.get_single_nhs).to be_kind_of(String)
      end
    end

    it "should have a admin county that is a string or nil" do
      if @postcodesio.get_single_admin_county == nil
        expect(@postcodesio.get_single_admin_county).to be_nil
      else
        expect(@postcodesio.get_single_admin_county).to be_kind_of(String)
      end
    end

    it "should have a admin district that is a string or nil for a single postcode" do
      if @postcodesio.get_single_admin_district == nil
        expect(@postcodesio.get_single_admin_district).to be_nil
      else
        expect(@postcodesio.get_single_admin_district).to be_kind_of(String)
      end
    end

    it "should have a admin ward that is a string or nil" do
      if @postcodesio.get_single_admin_ward == nil
        expect(@postcodesio.get_single_admin_ward).to be_nil
      else
        expect(@postcodesio.get_single_admin_ward).to be_kind_of(String)
      end
    end

    it "should have a longitude that is a float" do
      expect(@postcodesio.get_single_longitude) .to be_kind_of(Float)
    end

    it "should have a latitude that is a float" do
      expect(@postcodesio.get_single_longitude).to be_kind_of(Float)
    end

    it "should have a parliamentary constituency that is a string or nil" do
      if @postcodesio.get_single_parliamentary_constituency == nil
        expect(@postcodesio.get_single_parliamentary_constituency).to be_nil
      else
        expect(@postcodesio.get_single_parliamentary_constituency).to be_kind_of(String)
      end
    end

    it "should have a european electoral region that is a string or nil" do
      if @postcodesio.get_single_eer == nil
        expect (@postcodesio.get_single_eer).to be_nil
      else
        expect(@postcodesio.get_single_eer).to be_kind_of(String)
      end
    end

    it "should have a primary care trust that is a string or nil" do
      if @postcodesio.get_single_pct == nil
        expect (@postcodesio.get_single_pct).to be_nil
      else
        expect(@postcodesio.get_single_pct).to be_kind_of(String)
      end
    end

    it "should have a region that is a string or nil" do
      if @postcodesio.get_single_region == nil
        expect (@postcodesio.get_single_region).to be_nil
      else
        expect(@postcodesio.get_single_region).to be_kind_of(String)
      end
    end

    it "should have a parish that is a string or nil" do
      if @postcodesio.get_single_parish == nil
        expect (@postcodesio.get_single_parish).to be_nil
      else
        expect(@postcodesio.get_single_parish).to be_kind_of(String)
      end
    end

    it "should have a lsoa that is a string or nil" do
      if @postcodesio.get_single_lsoa == nil
        expect (@postcodesio.get_single_lsoa).to be_nil
      else
        expect(@postcodesio.get_single_lsoa).to be_kind_of(String)
      end
    end

    it "should have a msoa that is a string or nil" do
      if @postcodesio.get_single_msoa == nil
        expect (@postcodesio.get_single_msoa).to be_nil
      else
        expect(@postcodesio.get_single_msoa).to be_kind_of(String)
      end
    end

    it "should have a ccg that is a string or nil" do
      if @postcodesio.get_single_ccg == nil
        expect (@postcodesio.get_single_ccg).to be_nil
      else
        expect(@postcodesio.get_single_ccg).to be_kind_of(String)
      end
    end

    it "should have a nuts that is a string or nil" do
      if @postcodesio.get_single_nuts == nil
        expect (@postcodesio.get_single_nuts).to be_nil
      else
        expect(@postcodesio.get_single_nuts).to be_kind_of(String)
      end
    end

    it "should have an incode" do
      expect(@postcodesio.get_postcode).to include(@postcodesio.get_incode)
    end

    it "should have an outcode" do
      expect(@postcodesio.get_postcode).to include(@postcodesio.get_outcode)
    end

    it "should have codes section as a Hash" do
      expect(@postcodesio.get_code).to be_kind_of(Hash)
    end

    it "should have an admin_district in codes as a String" do
      expect(@postcodesio.get_code_addistrict).to be_kind_of(String)
    end

    it "should have an admin_county in codes as a String" do
      expect(@postcodesio.get_code_adcounty).to be_kind_of(String)
    end

    it "should have an admin_ward in codes as a String" do
      expect(@postcodesio.get_code_adward).to be_kind_of(String)
    end

    it "should have a parish in codes as a String" do
      expect(@postcodesio.get_code_parish).to be_kind_of(String)
    end

    it "should have a parliamentary_constituency in codes as a String" do
      expect(@postcodesio.get_code_parliamentary_constituency).to be_kind_of(String)
    end

    it "should have a ccg in codes as a String" do
      expect(@postcodesio.get_code_ccg).to be_kind_of(String)
    end

    it "should have a nuts in codes as a String" do
      expect(@postcodesio.get_code_nuts).to be_kind_of(String)
    end
  end
end
