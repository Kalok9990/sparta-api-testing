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
  end

end
