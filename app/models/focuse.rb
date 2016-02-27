class Focuse
	include Mongoid::Document
	include Mongoid::Timestamps
	has_many :articles, class_name: "Article", as: :articleable

	field :title, type: String
	field :des, type: String
	field :content, type: String
	mount_uploader :banner, AvatarUploader
	mount_uploader :picture, AvatarUploader
end