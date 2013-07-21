class Event < ActiveRecord::Base
  validates :organizer_name, :presence => { :message => "Must add Oraganizer Name" }
  validates :title, :presence => { :message => "Must add a Title" }
  validates :organizer_email, :presence => { :message => "Must add an Oraganizer Email Address" }
  validates :title, :uniqueness => { :message => "Title is already taken" }
  validate :date_cannot_be_in_the_past
  validates :organizer_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Enter 
             a valide email address" }
  
  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "Date cannot be in the past")
    end
  end
end
