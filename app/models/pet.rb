class Pet < ApplicationRecord
  SPECIES = ["dog", "cat", "snake", "rabit", "turtle"]
  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
end
