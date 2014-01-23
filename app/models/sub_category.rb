class SubCategory < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_many :articles
end
