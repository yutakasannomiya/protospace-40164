class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :authenticate_user!

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    redirect_to '/'
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    redirect_to root_path
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  
end
