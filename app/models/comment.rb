class Comment < ActiveRecord::Base
	belongs_to :post, foreign_key: "post_id", primary_key: "id"
	belongs_to :user, foreign_key: "commenter_id", primary_key: "id"
	validates :post, :presence => true
	validates :user, :presence => true
end
