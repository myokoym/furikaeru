require "furikaeru/base"

module Furikaeru
  class Editor
    include Base

    def edit(type_query)
      last = last_path(type(type_query))
      path = path(type(type_query))
      if last && !File.file?(path)
        File.write(path, File.read(last))
      end
      editor = `echo $EDITOR`.chomp
      system(editor, path)
    end
  end
end
