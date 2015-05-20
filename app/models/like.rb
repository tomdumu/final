class Like < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => :post_id
	validates_uniqueness_of :post_id, :scope => :user_id

	validates :user_id, :allow_nil => false, :presence => true
	validates :post_id, :presence => true, :allow_nil => false

	belongs_to :user, foreign_key: "user_id", primary_key: "id"
	belongs_to :post, foreign_key: "post_id", primary_key: "id"
	validates :user, :presence => true
	validates :post, :presence => true
end
