# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  transaction_id :integer
#  start_on       :date
#  end_on         :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Booking < ActiveRecord::Base

  belongs_to :transaction

  attr_accessible :transaction_id, :end_on, :start_on

  validates :start_on, :end_on, presence: true
  validates_with DateValidator,
                 attribute: :end_on,
                 compare_to: :start_on,
                 restriction: :on_or_after

  ## TODO REMOVE THIS
  def duration
    (end_on - start_on).to_i + 1
  end

end
