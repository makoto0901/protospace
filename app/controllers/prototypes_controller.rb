class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def show
  end

  def edit
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path, notice: 'update successfully', id: params[:id]
    end
    # TOPの場合はメッセージ表示可能
    # redirect_to :root, notice: 'update successfully', id: params[:id]
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end
end
