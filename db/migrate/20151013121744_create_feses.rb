class CreateFeses < ActiveRecord::Migration
  def change
    create_table :feses do |t|
      t.string :fesName, null: false
      t.string :adminName, null: false
      t.string :adminTwitterID, null: false
      t.text :description
      t.string :rule, null: false
      t.integer :limitNumberOfTeam, null: false
      t.datetime :startDate, null: false
      t.datetime :registrationDeadline, null: false
      t.string :adminCommunityName
      t.string :adminCommunityURL

      t.timestamps null: false
    end
  end
end
