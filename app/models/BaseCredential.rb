class BaseCredential
  include ::ActiveJsonModel::Model

  json_attribute :type
  json_polymorphic_via do |data|
    if data[:type] == 'username_password'
      UsernamePasswordCredential
    else
      OauthTokenCredential
    end
  end
end