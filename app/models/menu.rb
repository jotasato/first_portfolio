class Menu < ApplicationRecord
     mount_uploader :menu_image_id, ImgUploader  #CarrierWave機能を呼び出すための記述 
     has_many :mealrecords, dependent: :destroy
     has_many :users, dependent: :destroy, through: :mealrecords
end
