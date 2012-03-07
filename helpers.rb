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
  ($sections[row['Section'].strip] ||= []) << {
    :img => row['Image'], :desc => row['Description']
  }
end

CSV.foreach('data/sects.csv', :headers => true, :col_sep => "\t") do |row|
  $scenarios[row['Section'].strip] = row['Scenario']
end
