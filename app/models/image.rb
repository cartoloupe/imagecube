class Image < ActiveRecord::Base
  mount_uploader :file, CubeImageUploader
end
