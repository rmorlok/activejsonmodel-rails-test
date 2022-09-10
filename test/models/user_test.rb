require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "create empty user" do
    u = User.new

    assert_nil u.first_name
    assert_nil u.last_name
    assert_nil u.credentials
    assert_nil u.address
    assert_nil u.contact_method
    assert_nil u.secret_contact_method
    assert_not_nil u.previous_credentials
    assert_equal 0, u.previous_credentials.length
  end

  test "save empty user" do
    u = User.new
    assert u.save

    up = User.find_by(id: u.id)

    assert_nil up.first_name
    assert_nil up.last_name
    assert_nil up.credentials
    assert_nil up.address
    assert_nil u.contact_method
    assert_nil u.secret_contact_method
    assert_not_nil up.previous_credentials
    assert_equal 0, up.previous_credentials.length
  end

  test "create user" do
    u = User.new(
      first_name: 'Bob',
      last_name: 'Dole',
      credentials: UsernamePasswordCredential.new(username: 'bdole', password: 'senate'),
      address: Address.new(street: 'First St SE', city:'Washington',  state:'DC', zipcode:'20004'),
      previous_credentials: [
        UsernamePasswordCredential.new(username: 'candidate', password: 'president'),
        OauthTokenCredential.new(access_token: '1234', refresh_token: '5678'),
      ],
      contact_method: Email.new(label: 'home', email: 'bob@example.com'),
      secret_contact_method: Address.new(street: '123 Top Secret', city: 'Washington', state: 'DC', zipcode:'20004')
    )

    assert u.save

    up = User.find_by(id: u.id)

    assert up.credentials.is_a?(UsernamePasswordCredential)
    assert_equal 'bdole', up.credentials.username

    assert up.address.is_a?(Address)
    assert_equal 'Washington', up.address.city

    assert_equal 2, up.previous_credentials.length

    assert up.previous_credentials[0].is_a?(UsernamePasswordCredential)
    assert 'president', up.previous_credentials[0].password

    assert up.previous_credentials[1].is_a?(OauthTokenCredential)
    assert '1234', up.previous_credentials[1].access_token

    assert up.contact_method.is_a?(Email)
    assert_equal 'bob@example.com', up.contact_method.email

    assert up.secret_contact_method.is_a?(Address)
    assert_equal '123 Top Secret', up.secret_contact_method.street
  end
end
