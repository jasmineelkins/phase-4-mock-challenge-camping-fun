class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates :time, presence: true
    validate :time_range

    def time_range
        if time < 0 || time > 23
            errors.add(:time, "Not within range")
        end
    end
end
