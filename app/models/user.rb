class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	acts_as_token_authenticatable

	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable

	after_initialize :set_defaults

	validates :name, presence: true, length: { minimum: 3, maximum: 30 }
	validates :email, presence: true, uniqueness: true
	validates :is_admin, inclusion: [true, false], exclusion: [nil]

	has_many :posts
	has_many :comments
	has_many :upvotes

	has_one_attached :profile_picture

	private

	def set_defaults
		is_admin = false
	end
end
