class ContactMethod
  include ::ActiveJsonModel::Model

  # This is designed to test a case where there isn't a parent/child
  # relationship between this class and the concrete ones
  json_polymorphic_via do |data|
    if data[:street]
      Address
    else
      Email
    end
  end
end