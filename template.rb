class AbstractReport
  def generate
    print header
    print subtitle
    print body
    print after_body_hook
    print footer
  end

  def header
    raise NotImplementedError
  end

  def subtitle
    raise NotImplementedError
  end

  def body
    raise NotImplementedError
  end

  def after_body_hook; end

  def footer
    raise NotImplementedError
  end
end

class HtmlReport < AbstractReport
  def header
    "<h1>This is a report</h1>\n"
  end

  def subtitle
    "<h2>This is a subtitle</h2>\n"
  end

  def body
    "<p>This is the body of the report</p>\n"
  end

  def after_body_hook
    "<hr>\n"
  end

  def footer
    "<p>footer 2017</p>\n"
  end
end

class XmlReport < AbstractReport
  def header
    "<header>This is a report</header>\n"
  end

  def subtitle
    "<subtitle>This is a subtitle</subtitle>\n"
  end

  def body
    "<body>This is the body of the report</body>\n"
  end

  def footer
    "<footer>footer 2017</footer>\n"
  end
end

puts "HTML Report"
puts "-----------"
HtmlReport.new.generate
puts "XML Report"
puts "----------"
XmlReport.new.generate
