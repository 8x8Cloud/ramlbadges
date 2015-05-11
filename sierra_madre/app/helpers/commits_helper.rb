module CommitsHelper
  def raml2html(filename)
    content = `raml2html #{@commit.raw_url(filename)}`.html_safe
    
    if $?.success?
      content
    else
      false
    end
  end
end
