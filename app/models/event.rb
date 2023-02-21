require 'date'

class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
  belongs_to :user
	
	validates :start_date, presence:true
	validates :duration, presence:true, numericality: { only_integer: true }
	validates :title, presence:true, length: { in: 5..140 }
	validates :description, presence:true, length: { in: 20..1000 }
	validates :price, presence:true, numericality: { only_integer: true, in: 1..1000 }
	validates :location, presence:true,

  validate :valid_eligiblity?

  def valid_eligiblity?
    return unless :start_date?

    if !:start_date.after?(Date.today)
      errors.add(:start_date, "La date n'est pas valide")
    end
  end

  validate :valid_duration?
  	return unless :duration?

    if !duration % 5 == 0
      errors.add(:duration, "La durée n'est pas valide, veuillez rentrer un nombre multiple de 5")
    end
  end
end

end
