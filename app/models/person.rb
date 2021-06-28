class Person < ApplicationRecord


    has_many :enemies, dependent: :nullify 
    before_validation :set_reason 
    accepts_nested_attributes_for :enemies, reject_if: proc{|attr| attr['name'].blank?}

    
    private

    def set_reason
      if self.reason.blank?
        self.reason = Faker::Superhero.power
      end
    end


end
