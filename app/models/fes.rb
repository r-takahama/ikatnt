class Fes < ActiveRecord::Base
    has_many :participations
    has_many :matches
    has_many :tables
end
