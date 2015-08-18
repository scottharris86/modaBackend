class DefaultLocationSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*DefaultLocation.attribute_names.map(&:to_sym))
  has_one :location, :as => :locatable
end
