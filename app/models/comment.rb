class Comments < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end