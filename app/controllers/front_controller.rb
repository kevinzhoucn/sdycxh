class FrontController < ApplicationController
  def index
    @sub_category_recent = Article.recent
  end
end
