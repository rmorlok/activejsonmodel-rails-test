class OauthTokenCredential
  include ::ActiveJsonModel::Model

  json_fixed_attribute :type, value: 'oauth_token'
  json_attribute :access_token, String
  json_attribute :refresh_token, String
end