class Admin::TopicsController < Admin::AdminBackEndController
    
  def index
    if !params[:topic_ids].nil?
      Topic.destroy_all(["id in (?)", params[:topic_ids]])
    end
    @topics = Topic.paginate :page => params[:page], :per_page => 15, :order => "id desc"
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to :action => "index"
  end

end
