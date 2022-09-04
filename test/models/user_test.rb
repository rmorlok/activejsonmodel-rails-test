require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "create user" do
    u = User.new(
      first_name: 'Bob',
      last_name: 'Dole',
      credentials: UsernamePasswordCredential.new(username: 'bdole', password: 'senate'),
      address: Address.new(street: 'First St SE', city:'Washington',  state:'DC', zipcode:'20004')
    )

    assert u.save

    up = User.find_by(id: u.id)

    assert_equal 'bdole', up.credentials.username
    assert_equal 'Washington', up.address.city
  end
end
