class ArticleThumb
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :file, ArticleThumbUploader
  field :file, type: String
end
