class Grudge < ApplicationRecord
    has_many :enemies

    def threat_level
        self.enemies.sum(:threat_level)
      end
    
      def number_of_enemies
        self.enemies.count
      end
end
