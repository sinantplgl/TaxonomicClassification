class Category < ApplicationRecord
    before_save :generate_slug
    belongs_to :category, optional: true
    has_many :categories
    has_many :insects
    
    
    def generate_slug
        c = self
        slug = ""
        if c.category_id.nil?
            c.slug = c.name.parameterize
        else
            c.slug = "#{c.category.slug}-#{c.name.parameterize}"
        end
        
        while Category.exists?(slug: c.slug) do
            c.slug = "#{c.slug}#{(97 + rand(26)).chr}}"
        end
    end
end
