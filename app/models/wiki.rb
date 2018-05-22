class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  validates :user, presence: true

  scope :visible_to, -> (user) { user ? all : where(private: false) }

  def publicize
    update_attribute(:private, false)
  end
end
