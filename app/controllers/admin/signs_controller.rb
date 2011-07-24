class Admin::SignsController < Admin::AdminBackEndController
    
  def index
    if !params[:sign_ids].nil?
      Sign.destroy_all(["id in (?)", params[:sign_ids]])
    end
    @signs = Sign.paginate :page => params[:page], :per_page => 15, :order => "id desc"
  end

  def new
    @sign_categories = SignCategory.all
    @sign = Sign.new
  end

  def edit
    @sign_categories = SignCategory.all
    @sign = Sign.find(params[:id])
  end
  
  def create
    @sign = Sign.new(params[:sign])
    if @sign.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @sign = Sign.find(params[:id])
    if @sign.update_attributes(params[:sign])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @sign = Sign.find(params[:id])
    @sign.destroy
    redirect_to :action => "index"
  end
  
end