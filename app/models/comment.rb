class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  validates :body, :commentable_type, :user, :presence => :true
  validates :body, :length => { maximum: 1000 }
end
