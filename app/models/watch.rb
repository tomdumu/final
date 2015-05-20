class Watch < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => :forum_id
	validates_uniqueness_of :forum_id, :scope => :user_id

	validates :user_id, :allow_nil => false, :presence => true
	validates :forum_id, :presence => true, :allow_nil => false

	belongs_to :user, foreign_key: "user_id", primary_key: "id"
	belongs_to :forum, foreign_key: "forum_id", primary_key: "id"
	validates :user, :presence => true
	validates :forum, :presence => true
end
