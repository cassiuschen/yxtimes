class Article 
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :articleable, polymorphic: true

  mount_uploader :banner, AvatarUploader
  mount_uploader :picture, AvatarUploader
  
  field :title, type: String
  field :author, type: String
  field :des, type: String
  field :content, type: String
  field :tag, type: String, default: "other"

  field :articleable_id, type: String
  field :articleable_type, type: String
  field :kind, type: String, default: "essay"
  field :state, type: String, default: "up"

  #不属于聚焦和赛事的文章们自身分成两类
  TYPES = {
    'essay' => '文章',
    'work' => '阅读',
    'other' => '其他'
  }

  TYPES.keys.each do |s|
    scope s, -> {where kind: s.to_s }

    define_method :"#{s}?" do
      self.kind == s.to_s
    end
  end

  # 是否上首页（只有赛事可以有这个选项）
  STATES = {
    'up' => '上首页',
    'down' => '不上首页'
  }

  STATES.keys.each do |s|
    scope s, -> {where competition: s.to_s}

    define_method :"#{s}?" do 
        self.competition == s.to_s
    end
  end

  embeds_many :comments, as: :commentable


  TAGES = {
    'people' => '人物',
    'event'  => '事件',
    'survey' =>  '调查',
    'view'   => '观点'
  }

  TAGES.keys.each do |s|
    scope s, -> {where tag: s.to_s}

    define_method :"#{s}?" do
      self.tag == s.to_s
    end
  end
  

end
