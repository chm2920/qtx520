#encoding: utf-8

desc "production log"
task(:proc_log => :environment) do
  path = "#{RAILS_ROOT}/log/production.log"
  data = File.open(path, "r:utf-8").read
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  data = ic.iconv(data)
  
  arr = data.split('Started')
  arr = arr.reject(& :blank?)
  arr.reverse!
  i = 0
  l = arr.length
  ProcLog.destroy_all
  arr.each do |p|
    if p.strip != ""
      i = i + 1
      if i > 30
        break
      end
      puts i.to_s + ' of ' + l.to_s
      @method = ''
      @url = ''
      @ip = ''
      @visit_time = ''
      @completed = ''
      @views = ''
      @activerecord = ''
      p.scan(/(.*?)"\/(.*?)" for(.*?) at(.*?)\+0(.*?)00/m) do |method, url, ip, visit_time|
        @method = method.to_s.strip
        @url = url.to_s.strip
        @ip = ip.to_s.strip
        @visit_time = visit_time.to_s
      end
      p.scan(/(.*?)Completed(.*?)in (.*?)ms/m) do |a, b, c|
        @completed = c.to_s.strip
      end
      p.scan(/Views:(.*?)ms(.*?)ActiveRecord:(.*?)ms/) do |views, a, activerecord|
        @views = views.to_s.strip
        @activerecord = activerecord.to_s.strip
      end
      ProcLog.create(:method => @method, :url => @url, :ip => @ip, :visit_time => @visit_time, :completed => @completed, :views => @views, :activerecord => @activerecord)
    end
  end
end