class Follow < ActiveRecord::Base
	validates_uniqueness_of :follower_id, :scope => :leader_id
	validates_uniqueness_of :leader_id, :scope => :follower_id

	validates :follower_id, :allow_nil => false, :presence => true
	validates :leader_id, :presence => true, :allow_nil => false

	belongs_to :user, foreign_key: "follower_id", primary_key: "id"
	belongs_to :user, foreign_key: "leader_id", primary_key: "id"
	validates :user, :presence => true
end
