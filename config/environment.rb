#encoding: utf-8

require File.expand_path('../application', __FILE__)

# Initialize the rails application
Qtx520::Application.initialize!

require 'will_paginate'
# will_paginate custom label
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&lt;&lt; 上一页'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '下一页 &gt;&gt;'