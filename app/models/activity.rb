class Activity < ActiveRecord::Base
  belongs_to :user
  has_many   :counts
  has_many   :sessions

  validates :name, presence: true

  validates :name, format: { with: /\A[a-zA-Z0-9_]*[a-z A-Z][a-zA-Z0-9_]+\z/,
    message: "only allows letters, numbers and spaces" }

    validates :name, uniqueness: true
  end
