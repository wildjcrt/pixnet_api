module PixnetApi
  class PixnetOauth
    attr_accessor :consumer, :access_token
    include PixnetApi::Album

    def initialize
      @consumer = OAuth::Consumer.new(
        PIXNET_CONSUMER_CREDENTIALS[:key],
        PIXNET_CONSUMER_CREDENTIALS[:secret],
        PIXNET_CONSUMER_CREDENTIALS[:options]
      )
      @access_token = OAuth::AccessToken.new(
        @consumer,
        PIXNET_ACCESSTOKEN[:oauth_token],
        PIXNET_ACCESSTOKEN[:oauth_token_secret]
      )
      @data_sets = {}
      @check_sets = {}
    end

    def upload_pic(set_id, filename)
      return false unless check_album_set(set_id)
      
      url = URI.parse("http://emma.pixnet.cc/album/elements")
      file = File.new(filename)
      mime_type = `/usr/bin/file -bi #{file.path}`.strip.split(';')[0]
      req = Net::HTTP::Post::Multipart.new("/album/elements?set_id=#{set_id}", {
        "upload_file" => UploadIO.new(file, mime_type, file.path),
      })
      
      @access_token.sign!(req)
      Net::HTTP.new(url.host, url.port).start do |http|
        res = http.request(req)
        return JSON.parse(res.body)
      end
    end

    def upload_pic_by_url(set_id, pic_url)
      return false unless check_album_set(set_id)
      
      require 'open-uri'
      
      url = URI.parse("http://emma.pixnet.cc/album/elements")
      
      begin
        io = open(pic_url)
      rescue
        return false
      end
      
      return false unless (io.meta['content-length'].to_i > 0) && io.meta['content-type'].match(/^image/)
      
      req = Net::HTTP::Post::Multipart.new("/album/elements?set_id=#{set_id}", {
        "upload_file" => UploadIO.new(io, io.meta['content-type']),
      })
      
      @access_token.sign!(req)
      Net::HTTP.new(url.host, url.port).start do |http|
        res = http.request(req)
        return JSON.parse(res.body)
      end
    end
  end
end