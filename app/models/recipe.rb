class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: { strict: true }
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :preparation_time, presence: { strict: true }, length: { maximum: 20 }
  validates :cooking_time, presence: { strict: true }, length: { minimum: 1, maximum: 20 }
  validates :description, presence: { strict: true }, length: { minimum: 1, maximum: 1000 }
  validates :public, inclusion: { in: [true, false] }
end
