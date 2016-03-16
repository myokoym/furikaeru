module Furikaeru
  module Base
    def path(type_query)
      basename = "#{[today, type(type_query)].join("-")}.md"
      File.join(base_dir, basename)
    end

    def last_path(type_query)
      Dir.glob("#{base_dir}/*-#{type(type_query)}.md").sort.reverse.first
    end

    def type(query)
      types.each do |type|
        if query == type
          return type
        else
          selected_types = types.select do |type|
            /\A#{query[0]}/ =~ type
          end
          if selected_types.size == 1
            return selected_types.first
          end
        end
      end
      raise "query is fuzzy"
    end

    def types
      [
        "yesterday",
        "commit",
        "today",
        "problem",
      ]
    end

    def base_dir
      File.expand_path("~/.furikaeru")
    end

    def today
      Time.now.strftime("%Y-%m-%d")
    end
  end
end
