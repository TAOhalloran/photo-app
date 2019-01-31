class AlbumController < ActionController::Base
  
  def albumCoverSet
    @album = Album.find(params[:album_id])
    @image = @album.images.find(params[:albumcover])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated Image"
    else
      render "edit"
    end
  end
end