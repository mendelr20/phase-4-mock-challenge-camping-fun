class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates :time, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:23}
end
