class Admin::SignCategoriesController < Admin::AdminBackEndController
    
  def index
    if !params[:sign_category_ids].nil?
      SignCategory.destroy_all(["id in (?)", params[:sign_category_ids]])
    end
    @sign_categories = SignCategory.all
  end

  def new
    @sign_category = SignCategory.new
  end

  def edit
    @sign_category = SignCategory.find(params[:id])
  end
  
  def create
    @sign_category = SignCategory.new(params[:sign_category])
    if @sign_category.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @sign_category = SignCategory.find(params[:id])
    if @sign_category.update_attributes(params[:sign_category])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @sign_category = SignCategory.find(params[:id])
    @sign_category.destroy
    redirect_to :action => "index"
  end
  
end