class Student < ApplicationRecord
  has_many :ducks

  validates :name, presence: true
  validates :mod, inclusion: { in: 1..5, message: "number must be between 1 and 5" }
end
