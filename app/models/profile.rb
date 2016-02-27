class Profile 
	include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  field :nickname, type: String, default: ""

  
end
