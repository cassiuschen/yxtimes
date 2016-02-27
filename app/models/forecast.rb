class Forecast
	include Mongoid::Document
  include Mongoid::Timestamps
	belongs_to :match

	field :content, type: String
end