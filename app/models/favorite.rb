class Favorite < ActiveRecord::Base
  belongs_to :user
  has_one :location, :as => :locatable, dependent: :destroy
end
