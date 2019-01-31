class Image < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :picture, PictureUploader
  validate :picture_size

  @slide = user.images.order("id DESC")
  @slide.find_each do |slide|
                   slide.increment!(:sort_order, + 1)

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
    end
  end
end
