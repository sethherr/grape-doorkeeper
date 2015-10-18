# This isn't actually in the database, it's only here to demonstrate serializers
class ImaginaryItem
  include ActiveModel::Serialization
  include ActiveModel::Model
  attr_accessor :name, :id, :secret
end
