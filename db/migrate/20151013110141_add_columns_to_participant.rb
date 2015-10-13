class AddColumnsToParticipant < ActiveRecord::Migration
  def change
    add_column :participations, :uid, :string
  end
end
