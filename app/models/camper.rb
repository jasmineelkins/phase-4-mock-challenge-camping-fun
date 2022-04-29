class Camper < ApplicationRecord
    has_many :signups, dependent: :destroy
    has_many :activities, through: :signups

    validates :name, presence: true
    validate :age_range

    def age_range
        if age < 8 || age > 18
            errors.add(:age, "Not within range")
        end
    end
end
