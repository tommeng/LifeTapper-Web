class Activity < ActiveRecord::Base
  belongs_to :user
  has_many   :counts
  has_many   :sessions
end
