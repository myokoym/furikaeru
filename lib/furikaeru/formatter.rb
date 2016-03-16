require "furikaeru/base"

module Furikaeru
  class Formatter
    include Base

    def format
      formatted = ""
      types.each do |type|
        formatted << "## #{type}\n\n"
        path = path(type)
        if File.file?(path)
          formatted << File.read(path)
        else
          formatted << "N/A\n"
        end
        formatted << "\n"
      end
      formatted.chomp
    end
  end
end
