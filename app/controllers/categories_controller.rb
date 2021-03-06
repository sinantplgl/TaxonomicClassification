class CategoriesController < ApplicationController
    def index
        @categories = Category.where(category_id: nil).to_a
        i = 0
        while i < @categories.count do
            item = @categories[i]
            if item.category_id.nil?
                item.slug = item.name
            else
                item.slug = "#{@categories.find{|x| x.id == item.category_id}.slug} / #{item.name}"
            end
            @categories = @categories | Category.where(category_id: item.id).to_a
            i = i + 1;
        end
    end

    def show
        @category = Category.where(slug: params[:slug]).first
        if @category.nil?
            render "error_pages/404.html", status: :not_found
            return
        end
        @sub_categories = Category.where(category_id: @category.id)
        @insects = @category.insects.to_a
        catIds = Category.where(category_id: @category.id).pluck(:id)
        while catIds.count != 0 do
            id = catIds.shift
            @insects = @insects | Insect.where(category_id: id).to_a
            catIds = catIds | Category.where(category_id: id).pluck(:id)
        end
    end

    def create
        Category.create(name: params[:category][:name], category_id: params[:category][:category_id])

        redirect_to categories_path
    end

    def edit
    end

    def update
        category = Category.where(id: params[:id]).first
        if category.nil?
            render "error_pages/404.html", status: :not_found
            return
        end
        
        parent = Category.where(id: params[:category][:category_id]).first
        while not parent.nil? do  
            if parent.id == category.id
                flash[:error] = "You cannot add a category as its own child..."
                redirect_to categories_path
                return
            end
            parent = parent.category
        end
        category.name = params[:category][:name]
        category.category_id = params[:category][:category_id]
        category.save

        children = category.categories.to_a
        while children.count != 0 do
            child = children.shift
            child.save
            children = children | Category.where(category_id: child.id).to_a
        end
        redirect_to categories_path
    end

    def destroy
    end
end

# def index
#     @categories = Category.where(category_id: nil).collect{|x| {id: x.id, name: x.name, category_id: x.category_id, slug: x.slug}}
#     @categories.each do |item|
#         if item[:category_id].nil?
#             item[:slugy] = item[:name]
#         elsif
#             item[:slugy] = "#{@categories.find{|x| x[:id] == item[:category_id]}[:slugy]} / #{item[:name]}"
#         end
        
#         @categories = @categories | Category.where(category_id: item[:id]).collect{|x| {id: x.id, name: x.name, category_id: x.category_id, slug: x.slug}}
#     end
# end