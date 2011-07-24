class SignsController < ApplicationController
  
  def index
    @sign_categories = SignCategory.find(:all, :order => "id asc")
  end
  
  def show
    @sign_categories = SignCategory.find(:all, :order => "id asc")
    @sign_category = SignCategory.find(params[:id])
    @signs = Sign.paginate :page => params[:page], :per_page => 6, :conditions => "sign_category_id = #{@sign_category.id}", :order => "id desc"
  end
  
end
