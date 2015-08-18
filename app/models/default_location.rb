class DefaultLocation < ActiveRecord::Base
    has_one :location, :as => :locatable
end
