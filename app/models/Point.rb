class Point
  include ::ActiveJsonModel::Model

  json_attribute :x, Integer
  json_attribute :y, Integer
end