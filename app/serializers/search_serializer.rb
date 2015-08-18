class SearchSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*Search.attribute_names.map(&:to_sym))
  has_one :location, :as => :locatable
end
