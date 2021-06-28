class Enemy < ApplicationRecord
  belongs_to :grudge, optional: true 
  belongs_to :person


  def person_name
    person ? person.name : ""
  end

  def person_name=(p_name)
    self.person = Person.find_or_create_by(name: p_name)
  end

  validates :name, :reason, :threat_level, presence: true
  validates :threat_level, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
end
