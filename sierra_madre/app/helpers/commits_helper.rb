module CommitsHelper
  def raml2html(filename)
    `raml2html #{@commit.raw_url(filename)}`.html_safe
  end
end
