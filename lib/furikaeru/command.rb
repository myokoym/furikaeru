require "thor"
require "furikaeru"

module Furikaeru
  class Command < Thor
    desc "edit TYPE", "Edit files"
    def edit(type)
      Editor.new.edit(type)
    end

    desc "read TYPE", "Read files"
    def read(type)
      Reader.new.read(type)
    end

    desc "format", "Show formated text"
    def format
      puts(Formatter.new.format)
    end

    desc "version", "Show version"
    def version
      puts(VERSION)
    end
  end
end
