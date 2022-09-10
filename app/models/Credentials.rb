class Credentials
  include ::ActiveJsonModel::Array

  json_array_of BaseCredential
end