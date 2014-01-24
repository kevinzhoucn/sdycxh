class Article < ActiveRecord::Base
  attr_accessible :content, :published, :title, :created_at, :category_id, :sub_category_id
  belongs_to :category
  belongs_to :sub_category
end
