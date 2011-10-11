class Admin::ProcLogsController < Admin::AdminBackEndController
  
  def index
    if !params[:proc_ids].nil?
      ProcLog.destroy_all(["id in (?)", params[:proc_log_ids]])
    end
    @proc_logs = ProcLog.paginate :page => params[:page], :per_page => 15, :order => "id desc"
  end
  
  def destroy
    @log = ProcLog.find(params[:id])
    @log.destroy
    redirect_to :action => :index
  end
  
end