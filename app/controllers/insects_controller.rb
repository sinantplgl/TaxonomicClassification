class InsectsController < ApplicationController
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
  end

  def create
    Insect.create(insect_params)
    redirect_to insects_path
  end

  def update
    insect = Insect.where(id: params[:id]).first
    if insect.nil?
      render "error_pages/404.html", status: :not_found
      return
    end

    insect.update(insect_params)
    redirect_to insect_path(insect.id)
  end

  def destroy
  end

  private
  def insect_params
    params.require(:insect).permit(:name, :category_id, :image, :details)
  end
end
