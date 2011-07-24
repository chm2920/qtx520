# coding: utf-8

desc "generate xml"
task(:generate_xml => :environment) do
  sign_categories = SignCategory.find(:all, :order => "id asc")
  f = File.new("public/xml/sign_categories.xml","w:UTF-8")
# f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
  f.puts "<sign_categories>"
  for sign_category in sign_categories
    f.puts "\t<sign_category>"
      f.puts "\t\t<name>" + sign_category["name"].to_s + "</name>"
    f.puts "\t</sign_category>"
  end
  f.puts "</sign_categories>"
  f.close
  
  signs = Sign.find(:all, :order => "id asc")
  f = File.new("public/xml/signs.xml","w:UTF-8")
# f.puts "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
  f.puts "<signs>"
  for sign in signs
    f.puts "\t<sign>"
      f.puts "\t\t<sign_category_id>" + sign["sign_category_id"].to_s + "</sign_category_id>"
      f.puts "\t\t<vs>" + sign["vs"].to_s + "</vs>"
    f.puts "\t</sign>"
  end
  f.puts "</signs>"
  f.close
end