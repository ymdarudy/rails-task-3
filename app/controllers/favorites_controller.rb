class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    # TODO:〇〇さんの投稿を　の記載削除（お気に入り一覧作ってから）
    redirect_to picture_path(params[:picture_id]), notice: "#{favorite.picture.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to picture_path(favorite.picture_id), notice: "#{favorite.picture.user.name}さんの投稿をお気に入り解除しました"
  end
end
