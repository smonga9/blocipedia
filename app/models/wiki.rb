class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  validates :user, presence: true
end
