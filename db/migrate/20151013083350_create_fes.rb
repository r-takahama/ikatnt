class CreateFes < ActiveRecord::Migration
  def change
    create_table :fes do |t|
      t.string :fesName
      t.string :adminName
      t.string :adminTwitterID
      t.text :description
      t.string :rule
      t.integer :limitNumberOfTeam
      t.datetime :startDate
      t.datetime :registrationDeadline
      t.string :adminCommunityName
      t.string :adminCommunityURL
      t.datetime :createDate

      t.timestamps null: false
    end
  end
end
