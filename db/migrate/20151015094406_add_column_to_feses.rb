class AddColumnToFeses < ActiveRecord::Migration
  def change
    add_column :feses, :adminUserID, :string
  end
end
