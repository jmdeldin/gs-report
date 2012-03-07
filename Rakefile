task :default => :compile

desc 'Create HTML output in public/report.html'
task :compile do
  sh "erb report.html.erb > public/screens.html"
  sh "cat public/{head,intro,screens,foot}.html > public/report.html"
end

desc 'Create PDF output in public/report.pdf'
task :pdf => :compile do
  sh "wkhtmltopdf public/report.html public/report.pdf"
end

desc 'Remove compiled files'
task :clean do
  rm_rf 'public/{report,screens}.html public/report.pdf'
end
