class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
       redirect_to prototype_path(@comment.prototype.id)  # コメントと結びつくツイートの詳細画面に遷移する
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
