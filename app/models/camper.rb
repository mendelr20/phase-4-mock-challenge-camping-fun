class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 8, less_than_or_equal_to:18}

end
