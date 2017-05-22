class Address < ActiveRecord::Base
  belongs_to :person

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true



  #  'at most 5 digits
  validates :zip, presence:true, format: { with: /(^\d{,5}$)/, message: 'must have at most 5 digits'}

  # Ordinary U.S. zip validation /^[\d]{5}(-[\d]{4})?$/

end
