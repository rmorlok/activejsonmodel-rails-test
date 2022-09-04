class Address
  include ::ActiveJsonModel::Model

  json_attribute :street, String
  json_attribute :city, String
  json_attribute :zipcode, String
  json_attribute :state, String, validation: {inclusion: {in: %w[AK AL AR AS AZ CA CO CT DC DE FL GA GU HI IA ID IL IN KS KY LA MA MD ME MI MN MO MP MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR RI SC SD TN TX UM UT VA VI VT WA WI WV WY] }}
end