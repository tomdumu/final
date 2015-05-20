class Forum < ActiveRecord::Base
	# validates :forum_name
	validates :forum_name, :uniqueness => true, :allow_nil => false, :presence => true
	
	belongs_to :user, foreign_key: "admin_id", primary_key: "id"
	validates :user, :presence => true
	has_many :posts, foreign_key: "forum_id", inverse_of: :forum, dependent: :destroy
	has_many :watch, foreign_key: "forum_id", inverse_of: :forum, dependent: :destroy
end
