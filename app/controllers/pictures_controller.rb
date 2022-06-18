class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
  before_action :ensure_user, only: %i[ edit update destroy ]

  def index
    @pictures = Picture.all.order(updated_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    render :new and return if params[:back]
    if @picture.save
      redirect_to picture_url(@picture), notice: "新規投稿しました！"
    else
      render :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to picture_url(@picture), notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy

    redirect_to pictures_url, notice: "投稿を削除しました！"
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_user
    redirect_to pictures_path unless @picture.user == current_user
  end

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache, :user_id)
  end
end
