require 'digest'

module Jekyll
  module URLFilter
    def encode_md5(input)
      Digest::MD5::hexdigest(input)[0..4]
    end
    def get_mtime(input)
      File.mtime(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLFilter)
