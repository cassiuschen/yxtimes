class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :author, type: String
  field :uploader, type: String
  field :des, type: String
  field :content, type: String

  # 文章类型 
  field :type,  type: String
  # 聚焦 Focus, 观点 Opinion， 赛事 Game, 投票: Vote

end
