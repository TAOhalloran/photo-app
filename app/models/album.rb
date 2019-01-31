class Album < ActiveRecord::Base
    attr_accessible :title, :description, :album_id, :albumcover_id
    belongs_to :user
    has_many :images,  :dependent => :destroy
    has_one :albumcover, :class_name => "Image"
    validates :title, :description, :presence => true
end