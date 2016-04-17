class AddUserIdToBasicModel < ActiveRecord::Migration
  def change
    add_column :basic_models, :user_id, :int
  end
end
