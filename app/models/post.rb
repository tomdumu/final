class Post < ActiveRecord::Base
	belongs_to :forum, foreign_key: "forum_id", primary_key: "id"
	belongs_to :user, foreign_key: "poster_id", primary_key: "id"
	has_many :comments, inverse_of: :post, dependent: :destroy
	has_many :likes, inverse_of: :post, dependent: :destroy
	validates :user, :presence => true
	validates :forum, :presence => true

end
