

desc "get qq"
task(:get_qq => :environment) do
  
  require 'open-uri'
  
  sign_category_id = 12
  
  1.upto 6 do |i|
    url = "http://baidu.uqude.com/baidu_mobile_war/signature/querySignatureById.action?"
    params = "id=" + sign_category_id.to_s + "&count=" + i.to_s + "&t=1311496599430&pageSize=40"
    url += params
    puts url
    gets = open(url).read
    content = []
    gets.scan(/"content":"(.*?)"/) do |a|
      content << a[0].to_s
      Sign.create(:sign_category_id => 16, :vs => a[0].to_s)
    end
    puts content.join("\n")
  end
  
end

__END__

http://baidu.uqude.com/baidu_mobile_war/signature/querySignatureById.action?id=1&count=1&t=1311496599430&pageSize=4


"list":[{"content":"听说现在结婚很便宜，民政局9块钱搞定，我请你吧！","id":"63","number":6463,"page":43,"typeId":"1"},{"content":"如果我用你待我的方式来待你， 恐怕你会恨死我。","id":"1629","number":6200,"page":43,"typeId":"1"},{"content":"男人知道你爱他就不会开口说爱你了，因为他处于上风；男人只有自信心不够的时候，才会对女人说“我爱你”。","id":"13","number":9284,"page":43,"typeId":"1"},{"content":"什么时候想嫁人了就告诉我，我娶你。 ","id":"69","number":5731,"page":43,"typeId":"1"}],"success":"true"