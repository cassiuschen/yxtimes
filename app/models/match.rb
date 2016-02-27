class Match 
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :articles, class_name: "Article", as: :articleable
  has_many :reports
  has_many :forecasts

  field :kind, type: String, default: "basketball"
  field :name, type: String
  field :state, type: String, default: "off"
  mount_uploader :agenda, AvatarUploader

  TYPES = {
    'basketball' => '篮球杯',
    'football'    => '足球杯',
    'drama'       => '戏剧节',
    'dance'       => '舞蹈节' 
  }

  TYPES.keys.each do |s|
    scope s, -> {where kind: s.to_s} 

    define_method :"#{s}?" do
      self.kind == s.to_s
    end
  end

  STATES = {
    'on' => '举行中',
    'off'  => '已结束'
  }

  STATES.keys.each do |s|
    scope s, -> {where kind: s.to_s} 

    define_method :"#{s}?" do
      self.kind == s.to_s
    end
  end

end