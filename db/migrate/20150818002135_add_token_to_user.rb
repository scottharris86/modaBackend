class AddTokenToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :authentication_token, null: false, default: ""
    end
  end
end
