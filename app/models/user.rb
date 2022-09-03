class User < ApplicationRecord
  attribute :credentials, BaseCredential.encrypted_attribute_type
end
