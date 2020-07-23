class Player < ApplicationRecord
  
  validates :user_name, length: in: 5..20
  
  belongs_to :team
end
