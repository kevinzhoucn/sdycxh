# encoding: utf-8
class Admin::SubCategoriesController < Admin::BaseController  
  # GET /categories
  # GET /categories.json
  def index
    @sub_categories = SubCategory.all    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @sub_categories = SubCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @sub_category = SubCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @sub_category = SubCategory.find(params[:id])
    @categories = Category.all
  end

  # POST /categories
  # POST /categories.json
  def create
    @sub_category = SubCategory.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      if (not @category.own_id.present?) && @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: '成功更新类别名称.' }
        format.json { head :no_content }
      else
        format.html { redirect_to front_admin_url, notice: "无法修改系统类别,只能修改自定义类别" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @sub_category = SubCategory.find(params[:id])
    if (not @category.own_id.present?)
      @category.destroy
    end

    respond_to do |format|
      format.html { redirect_to front_admin_url, notice: "删除完成" }
      format.json { head :no_content }
    end
  end
end
