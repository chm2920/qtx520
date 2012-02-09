class Admin::FlsController < Admin::AdminBackEndController
    
  def index
    if !params[:fl_ids].nil?
      Fl.destroy_all(["id in (?)", params[:fl_ids]])
    end
    @fls = Fl.paginate :page => params[:page], :per_page => 15, :order => "id desc"
  end

  def new
    @fl_categories = FlCategory.all
    @fl = Fl.new
  end

  def edit
    @fl_categories = FlCategory.all
    @fl = Fl.find(params[:id])
  end
  
  def create
    @fl = Fl.new(params[:fl])
    if @fl.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @fl = Fl.find(params[:id])
    if @fl.update_attributes(params[:fl])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @fl = Fl.find(params[:id])
    @fl.destroy
    redirect_to :action => "index"
  end
  
end