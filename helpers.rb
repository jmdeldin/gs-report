require 'csv'

def i(basename)
  '<img width="316" alt="" src="%s">' % File.join('img', "#{basename.downcase}.png")
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
