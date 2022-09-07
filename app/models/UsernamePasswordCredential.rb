class UsernamePasswordCredential < BaseCredential
  json_fixed_attribute :type, value: 'username_password'
  json_attribute :username, String
  json_attribute :password, String
end