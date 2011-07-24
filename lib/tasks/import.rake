# coding: utf-8

desc "import xml"
task(:import_xml => :environment) do
  name = "sign_categories.xml"
  directory = "#{RAILS_ROOT}/public/xml/"
  path = File.join(directory, name)
  
  xml_data = File.open(path, "r:utf-8")
  result = ""
  xml_data.each_line do |line|
    result += line
  end
  hsh = Hash.from_xml(result)
  for sign_category in hsh["sign_categories"]["sign_category"]
    t = SignCategory.new
    t.name = topic["name"]
    t.save
  end
  
  
  name = "signs.xml"
  directory = "#{RAILS_ROOT}/public/xml/"
  path = File.join(directory, name)
  
  xml_data = File.open(path, "r:utf-8")
  result = ""
  xml_data.each_line do |line|
    result += line
  end
  hsh = Hash.from_xml(result)
  for sign in hsh["signs"]["sign"]
    p = Sign.new
    p.sign_category_id = sign["sign_category_id"].to_i
    p.vs = sign["vs"]
    p.save
  end
end