class Post < ActiveRecord::Base
  validates :title, 
    :presence => true, 
    :length => {maximum: 140}
  validates :body, 
    :presence => true, 
    :length =>{maximum: 5000}
end
