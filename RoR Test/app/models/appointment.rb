class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :customer, class_name: 'Person', foreign_key: 'person_id'

  attr_accessible :date_of_visit, :pet, :customer, :reminder_required, :reason_for_visit

  validates :pet, presence: true


  validates :customer, presence: true
  
  validates :date_of_visit, presence: true
  validates :reason_for_visit, presence: true

  validate :date_of_visit_cannot_be_in_the_past

  def date_of_visit_cannot_be_in_the_past
    if !date_of_visit.blank? and date_of_visit < Date.today
      errors.add(:date_of_visit, "No early date")
    end
  end

end