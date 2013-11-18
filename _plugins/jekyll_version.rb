module Jekyll
  class JekyllVersionTag < Liquid::Tag

    def initialize(tag_name, text, token)
      super
    end

    def render(context)
      "#{Jekyll::VERSION}"
    end
  end
end

Liquid::Template.register_tag('jekyll_version', Jekyll::JekyllVersionTag)