class RemoveFesidFromParticipation < ActiveRecord::Migration
  def change
    remove_column :participations, :fesID, :integer
  end
end
