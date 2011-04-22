class Admin::PostsController < Admin::AdminBackEndController
    
  def index
    if !params[:post_ids].nil?
      Post.destroy_all(["id in (?)", params[:post_ids]])
    end
    @posts = Post.paginate :page => params[:page], :per_page => 15, :order => "id desc"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :action => "index"
  end

end
