class AddPolyRelationToLocation < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.references :locatable, polymorphic: true, index: true
    end
  end
end
