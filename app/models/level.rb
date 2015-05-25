class Level < ActiveRecord::Base
	validates_uniqueness_of :user_id
	validates :user_id, :allow_nil => false, :presence => true
	belongs_to :user, foreign_key: "user_id", primary_key: "id"
	validates :user, :presence => true
end
