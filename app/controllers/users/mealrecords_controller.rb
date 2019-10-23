class Users::MealrecordsController < ApplicationController
    #ユーザーに紐づく食事記録を作成
    def create #menu_idが,menu#showのビューからヒドゥンで送られてきて、次に@mealrecordにuser_idの情報を入れてやり、ユーザーとメニュー2つのidが入ったインスタンスを作成する。
        @mealrecord = Mealrecord.new(mealrecord_params)
        @mealrecord.user_id = current_user.id
        if @mealrecord.save
            redirect_to usermealrecord_path
        else
            redirect_to menu_path(params[:mealrecord][:menu_id])
        end    
    end

    def update 
    end
   
    #選択した食事記録を削除
    def destroy  
        @mealrecord = Mealrecord.find(params[:id])
        @mealrecord.destroy
        redirect_to usermealrecord_path
    end

    private
    def mealrecord_params
        params.require(:mealrecord).permit(:menu_id)
    end
 
end