class User < ApplicationRecord
  attribute :credentials, BaseCredential.encrypted_attribute_type
  attribute :address, Address.attribute_type
end
