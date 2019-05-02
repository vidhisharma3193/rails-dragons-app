class Dragon < ApplicationRecord
    belongs_to :user

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than_or_equal_to: 1000, less_than_or_equal_to: 3000}
    
end
