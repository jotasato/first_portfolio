class Mealrecord < ApplicationRecord
    belongs_to :user
    belongs_to :menu

    scope :created_today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) } #今日保存されたレコードを取得する

end
