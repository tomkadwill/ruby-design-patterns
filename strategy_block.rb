class Report
  attr_accessor :header, :subtitle, :body, :footer

  def initialize(&formatter)
    @formatter = formatter
    @header = 'This is a report'
    @subtitle = 'This is a subtitle'
    @body = 'This is the body of the report'
    @footer = 'footer 2017'
  end

  def output_report
    @formatter.call(self)
  end
end

HTMLFormatter = lambda do |context|
  puts "<h1>#{context.header}</h1>\n"
  puts "<h2>#{context.subtitle}</h2>\n"
  puts "<p>#{context.body}</p>\n"
  puts "<p>#{context.footer}</p>\n"
end

XMLFormatter = lambda do |context|
  puts "<header>#{context.header}</header>\n"
  puts "<subtitle>#{context.subtitle}</subtitle>\n"
  puts "<body>#{context.body}</body>\n"
  puts "<footer>#{context.footer}</footer>\n"
end

puts "HTML Report"
puts "-----------"
report = Report.new(&HTMLFormatter)
report.output_report

puts "XML Report"
puts "----------"
report = Report.new(&XMLFormatter)
report.output_report
