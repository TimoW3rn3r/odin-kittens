class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, inclusion: { in: 1..100, message: "is invalid" }
  validates :cuteness, presence: true
  validates :softness, presence: true
end
