class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          acts_as_paranoid #論理削除の定義

  enum gender: { male: 0, female: 1 }

  has_many :graphs
  has_many :mealrecords 
  has_many :menus, dependent: :destroy, through: :mealrecords

  validates :height, :presence => true, :on => :update
  validates :weight, :presence => true, :on => :update
  validates :age, :presence => true, :on => :update

  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, length: { minimum: 6 }, :on => :create ,if: :password_required?





  
  

        #維持カロリーの計算記述
  def maintain_calories(params, momentum) 
        #送られてきた値が男の子だったらこちらで計算
    if params[:gender] == "male" 
        self.result = 66 + (13.7 * params[:weight].to_i) + (5.0 * params[:height].to_i) - (6.8 *params[:age].to_i) * momentum.to_f
      else
        # 女の子だった場合はこちらで計算
        self.result = 665.1 + (9.6 * params[:weight].to_i) + (1.7 * params[:height].to_i) - (7.0 *params[:age].to_i) * momentum.to_f
    end
  end

end
