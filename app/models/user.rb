class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: true 
    has_many :artworks
    has_many :artists, :through => :artworks 
    
    def slug
        name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end  
end 