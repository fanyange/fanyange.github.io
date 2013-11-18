require 'digest'

module Jekyll
  module URLFilter
    def encode_md5(input)
      Digest::MD5::hexdigest(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLFilter)