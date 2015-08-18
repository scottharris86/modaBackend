class FavoriteSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*Favorite.attribute_names.map(&:to_sym))
  has_one :location, :as => :locatable
end
