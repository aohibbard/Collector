class Artist < ActiveRecord::Base 
    has_many :artworks
    has_many :users, through: :artworks 

    def slug
        name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Artist.all.find{|artist| artist.slug == slug}
    end 

    def name_sorter
        split_name = self.name.split
        if split_name.size == 2 
             new_syntax = "#{split_name[-1]} #{split_name[0]}"
         elsif 
           split_name.size == 1 
           new_syntax = "#{name}"
        elsif
         split_name.size == 3 && split_name[1][0] == split_name[1][0].downcase
             new_syntax = "#{split_name[1]} #{split_name[-1]} #{split_name[0]}"
        elsif split_name.size == 3 && split_name[1][0] == split_name[1][0].upcase
             new_syntax = "#{split_name[2]} #{split_name[0]} #{split_name[1]}"
        else
        new_syntax = "#{split_name[-1]} #{split_name[0]}"
        end
        self.name_sorted = new_syntax
        self.save
     end 

    # make OAuth token request
    def token_request
        client_id = '643e92f4d76983c07a37'
        client_secret = '1eab7f6ddf929ef4dc42b0a74db7f5d1'
        api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
        response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
        @xapp_token = JSON.parse(response.body)['token']
    end 

    # Query API 
    def api_request
        @xapp_token ||= token_request

        api = Hyperclient.new("https://api.artsy.net/api") do |api|
        api.headers['Accept'] = 'application/vnd.artsy-v2+json'
        api.headers['X-Xapp-Token'] = @xapp_token
        api.connection(default: false) do |conn|
            conn.use FaradayMiddleware::FollowRedirects
            conn.use Faraday::Response::RaiseError
            conn.request :json
            conn.response :json, content_type: /\bjson$/
            conn.adapter :net_http
            end 
        end
        
        self.birthday = api.artist(id: self.slug).birthday
        self.nationality = api.artist(id: self.slug).nationality
        self.deathday = api.artist(id: self.slug).deathday
        self.biography = api.artist(id: self.slug).biography
        self.img_url = api.artist(id: self.slug).thumbnail
        self.save
    end

    # curl -v -L https://api.artsy.net/api/artists/kiki-smith -H
    # 'X-Xapp-Token:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IiIsInN1YmplY3RfYXBwbGljYXRpb24iOiI1ZTIwOWRmYzg0YmFkMzAwMGVhNmY2Y2YiLCJleHAiOjE1Nzk4MDA3MDAsImlhdCI6MTU3OTE5NTkwMCwiYXVkIjoiNWUyMDlkZmM4NGJhZDMwMDBlYTZmNmNmIiwiaXNzIjoiR3Jhdml0eSIsImp0aSI6IjVlMjA5ZGZjZDliODFmMDAxMzAxMjJhNiJ9.wawEbpyXEp2SdqWOQCkwJ_VM_LZWHALygHSeO3EY18A'



end 