class Users::MealrecordsController < ApplicationController

    def create #menu_idが,menu#showのビューからヒドゥンで送られてきて、次に@mealrecordにuser_idの情報を入れてやり、ユーザーとメニュー2つのidが入ったインスタンスを作成する。
        @mealrecord = Mealrecord.new(mealrecord_params)
        @mealrecord.user_id = current_user.id
        if @mealrecord.save
            redirect_to user_path(current_user)
        else
            
            redirect_to menu_path(params[:mealrecord][:menu_id])
        end
    
    end


    def update 


    end


    def destroy



    end




private
    def mealrecord_params
        params.require(:mealrecord).permit(:menu_id)
    end
  
  
 end