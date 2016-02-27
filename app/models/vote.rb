class Vote
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :subscript, type: String
  field :route, type: String
  field :kind, type: String, default: 'on'
  mount_uploader :banner, AvatarUploader

  TYPES = {
  	'on' => '发起中',
  	'off' => '已结束'
  }

  TYPES.keys.each do |s|
  	scope s, -> {where kind: s.to_s}

  	define_method :"#{s}?" do
  		self.kind == s.to_s
  	end
  end
end
