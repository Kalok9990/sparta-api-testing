require_relative 'services/single_postode_service'
require_relative 'services/multiple_postode_service'

class Postcodesio

  def single_postcode_service
    SinglePostcodeService.new
  end

  def multiple_postcodes_service
    MultiplePostcodeService.new
  end

end