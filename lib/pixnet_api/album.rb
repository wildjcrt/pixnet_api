module PixnetApi
  module Album
    def check_album_set(set_id)
      return @check_sets[set_id] if @check_sets[set_id].present?

      ret_json = JSON.parse(@access_token.get("/album/sets/#{set_id}").body)

      if 0 == ret_json["error"]
        @data_sets[set_id] = ret_json
        @check_sets[set_id] = true
        return true
      else
        @check_sets[set_id] = false
        return false
      end
    end

    def get_album_setfolder
      return JSON.parse(@access_token.get("/album/setfolders").body)
    end
    
    def get_album_sets
      return JSON.parse(@access_token.get("/album/sets").body)
    end
    
    def get_album_set(set_id)
      return JSON.parse(@access_token.get("/album/sets/#{set_id}").body)
    end
    
    def get_album_folders
      return JSON.parse(@access_token.get("/album/folders").body)
    end
    
    def get_album_folder(folder_id)
      return JSON.parse(@access_token.get("/album/folders/#{folder_id}").body)
    end
    
    def get_album_elements(set_id)
      return JSON.parse(@access_token.get("/album/elements/?set_id=#{set_id}").body)
    end
    
    def get_album_element(element_id)
      return JSON.parse(@access_token.get("/album/elements/#{element_id}").body)
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