require_relative "../../app/models/park.rb"

describe Park do
  describe "validations for park fields" do
   it{ is_expected.to validate_presence_of :name }
   it{ is_expected.to validate_presence_of :address }
   it{ is_expected.to validate_presence_of :city }
   it{ is_expected.to validate_presence_of :state }
   it{ is_expected.to validate_presence_of :zip }
   it{ is_expected.to validate_presence_of :description }
 end
end
