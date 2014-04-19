class Session < ActiveRecord::Base
  belongs_to :activity

  validates_datetime :start_date
  validates_datetime :end_date, :after => :start_date,
                                :after_message => "end date must be after start date"
end
