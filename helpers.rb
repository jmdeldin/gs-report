# -*- coding: utf-8 -*-
require 'csv'

def i(basename)
  fn = File.join('img', "#{basename.downcase}.png")

  s = '<a href="%s" title="View larger">' % fn
  s += '<img width="200" alt="" src="%s">' % fn
  s += '</a>'
end

$sections = {}
$scenarios = {}

CSV.foreach('data/desc.csv', :headers => true, :col_sep => "\t") do |row|
  next unless row['Section']
  desc = row['Description'].gsub(/“/, "&#8220").gsub(/”/, "&#8221;").gsub(/--/, "&#8211;")
  ($sections[row['Section'].strip] ||= []) << {
    :img => row['Image'], :desc => desc
  }
end

CSV.foreach('data/sects.csv', :headers => true, :col_sep => "\t") do |row|
  $scenarios[row['Section'].strip] = row['Scenario']
end
