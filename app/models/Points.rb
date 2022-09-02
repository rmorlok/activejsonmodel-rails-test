class Points
  include ::ActiveJsonModel::Array

  json_array_of Point
end