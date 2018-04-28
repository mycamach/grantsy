require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "should not save without dni" do
    organization = Organization.new
    assert_not organization.save
  end
end
