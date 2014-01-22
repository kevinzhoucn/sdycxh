class Article < ActiveRecord::Base
  attr_accessible :content, :published, :title, :created_at
  belongs_to :category
  belongs_to :sub_category
end
