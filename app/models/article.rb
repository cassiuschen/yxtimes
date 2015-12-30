class Article 
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :banner, AvatarUploader
  mount_uploader :picture, AvatarUploader
  
  field :title, type: String
  field :author, type: String
  field :des, type: String
  field :content, type: String
  field :tag, type: String
  field :picture, type: String
  field :banner, type: String

  # 文章类型 
  field :type,  type: String
  # 聚焦 Focus, 观点 Opinion， 赛事 Game, 投票: Vote


  TAGES = {
    people:  '人物',
    event:   '事件',
    survey:  '调查',
    view:    '观点'
  }

  

end
