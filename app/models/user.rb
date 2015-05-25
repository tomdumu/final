class User < ActiveRecord::Base

   # has_secure_password

	# validates :user_name, :presence => true
	validates :user_name, :uniqueness => true, :allow_nil => false, :presence => true
	validates :password, :presence => true, :allow_nil => false

	has_many :forums, foreign_key: "admin_id", inverse_of: :user, dependent: :destroy
	has_many :posts, foreign_key: "poster_id", inverse_of: :user, dependent: :destroy
	has_many :follows, foreign_key: "follower_id", inverse_of: :user, dependent: :destroy
	has_many :follows, foreign_key: "leader_id", inverse_of: :user, dependent: :destroy
	has_many :likes, foreign_key: "user_id", inverse_of: :user, dependent: :destroy
	has_many :watch, foreign_key: "user_id", inverse_of: :user, dependent: :destroy
	has_many :comment, foreign_key: "commenter_id", inverse_of: :user, dependent: :destroy
end
