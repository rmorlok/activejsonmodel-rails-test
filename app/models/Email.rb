class Email
  include ::ActiveJsonModel::Model

  json_attribute :email, String
  json_attribute :label, String
end