require "furikaeru/base"

module Furikaeru
  class Reader
    include Base

    def read(type_query)
      puts(File.read(path(type(type_query))))
    end
  end
end
