class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*User.attribute_names.map(&:to_sym))
  has_many :favorites
end
