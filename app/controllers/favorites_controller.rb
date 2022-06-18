class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorite_pictures.all
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_path(params[:picture_id]), notice: "#お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    if params[:name] == "favorite_index"
      redirect_to favorites_path, notice: "お気に入り解除しました"
    else
      redirect_to picture_path(favorite.picture_id), notice: "#お気に入り解除しました"
    end
  end
end
