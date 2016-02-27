class Comment 
  include Mongoid::Document
  include Mongoid::Timestamps
  embedded_in :commentable, polymorphic: true

  field :commenter
  field :commenter_head
  field :body

end
