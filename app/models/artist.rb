require 'net/http'
require 'json'

class Artist < ActiveRecord::Base 
    has_many :artworks
    has_many :users, through: :artworks 

    def slug
        name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Artist.all.find{|artist| artist.slug == slug}
    end 

    def self.find_artist(artist)
        client_id = '643e92f4d76983c07a37'
        client_secret = '1eab7f6ddf929ef4dc42b0a74db7f5d1'
        api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
        response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
        xapp_token = JSON.parse(response.body)['token']
    end 

    # curl -v -L https://api.artsy.net/api/artists/kiki-smith -H
    # 'X-Xapp-Token:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IiIsInN1YmplY3RfYXBwbGljYXRpb24iOiI1ZTIwOWRmYzg0YmFkMzAwMGVhNmY2Y2YiLCJleHAiOjE1Nzk4MDA3MDAsImlhdCI6MTU3OTE5NTkwMCwiYXVkIjoiNWUyMDlkZmM4NGJhZDMwMDBlYTZmNmNmIiwiaXNzIjoiR3Jhdml0eSIsImp0aSI6IjVlMjA5ZGZjZDliODFmMDAxMzAxMjJhNiJ9.wawEbpyXEp2SdqWOQCkwJ_VM_LZWHALygHSeO3EY18A'



end 