class RemoveIntriduceFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introduce, :string
  end
end
