class MainController < ApplicationController
    def index
        @main_categories = Category.where(category_id: nil).to_a
        @insects = Insect.all
    end
end
