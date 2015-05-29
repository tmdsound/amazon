#
# File compressor plugin for jekyll
# =================================
#
# By [mytharcher](https://github.com/mytharcher)
# 2012-05-20
#
# Updated by [nicoespeon](https://github.com/nicoespeon)
# 2013-04-12
#
# Updated by [juev](https://github.com/juev)
# 2013-04-14
# Remove js compression
#
# This plugin for compressing HTML files.
#
# For HTML files it uses Alan Moore's regexp :
# http://stackoverflow.com/questions/5312349/minifying-final-html-output-using-regular-expressions-with-codeigniter
# It removes spaces between HTML, excepted within
# <textarea> and <pre> code, so you don't get into trouble!
#

module Jekyll

  module Compressor

    def compress_html(content)
      content.gsub(/(?>[^\S ]\s*|\s{2,})(?=(?:(?:[^<]++|<(?!\/?(?:textarea|pre)\b))*+)(?:<(?>textarea|pre)\b|\z))/ix, '')
    end

    # Really writing process
    def output_file(dest, content)
      FileUtils.mkdir_p(File.dirname(dest))
      File.open(dest, 'w') do |f|
        f.write(content)
      end
    end

    def output_html(dest, content)
      path = self.destination(dest)
      self.output_file(path, compress_html(content))
    end

  end

  # Overwrite old methods to insert a hook

  class Post

    include Compressor

    def write(dest)
      self.output_html(dest, self.output)
    end

  end

  class Page

    include Compressor

    def write(dest)
      self.output_html(dest, self.output)
    end

  end

  class StaticFile

    include Compressor



  end

end