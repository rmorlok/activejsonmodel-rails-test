require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "create polygon" do
    u = User.new(first_name: 'Bob', last_name: 'Dole', credentials: UsernamePasswordCredential.new(username: 'bdole', password: 'senate'))

    assert p.save

    up = User.find_by(id: u.id)

    assert_equal 'bdole', u.credential.username
  end
end
