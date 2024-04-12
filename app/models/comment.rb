class Comment < ApplicationRecord
    belongs_to :earthquacke
    validates :body, presence: true
    
    
end
