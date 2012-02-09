class Admin::FlCategoriesController < Admin::AdminBackEndController
    
  def index
    if !params[:fl_category_ids].nil?
      FlCategory.destroy_all(["id in (?)", params[:fl_category_ids]])
    end
    @fl_categories = FlCategory.all
  end

  def new
    @fl_category = FlCategory.new
  end

  def edit
    @fl_category = FlCategory.find(params[:id])
  end
  
  def create
    @fl_category = FlCategory.new(params[:fl_category])
    if @fl_category.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @fl_category = FlCategory.find(params[:id])
    if @fl_category.update_attributes(params[:fl_category])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @fl_category = FlCategory.find(params[:id])
    @fl_category.destroy
    redirect_to :action => "index"
  end
  
end
