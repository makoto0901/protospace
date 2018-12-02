class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :edit, :update]
  before_action :set_prototype

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to prototype_path(params[:prototype_id]) }
        format.json
      end
    else
      redirect_to prototype_path(params[:prototype_id])
    end
  end

  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy
    end
    redirect_to prototype_path(params[:prototype_id])
  end

  def edit
  end

  def update
    if @comment.user_id == current_user.id
      @comment.update(comment_params)
    end
    redirect_to prototype_path(params[:prototype_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id],user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
