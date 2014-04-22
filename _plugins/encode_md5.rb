require 'digest'

module Jekyll
  module URLFilter
    def encode_md5(input)
      Digest::MD5::hexdigest(input)[0..4]
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLFilter)