class Dragon < ApplicationRecord

  belongs_to :user

validates :name, presence: true
validates :name, uniqueness: true
validates :age, numericality: {greater_than: 1000, less_than: 3000}



end
