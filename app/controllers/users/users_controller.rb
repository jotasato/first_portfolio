class Users::UsersController < ApplicationController
      
      before_action :authenticate_user!, only: :measurement
      
      
      
      def index
      end

      def show  
        @user = User.find(params[:id])
      end

      def new
      end

      def destroy
      end

      def create
      end

      #ユーザー情報更新
      def update  
        @user = current_user
        if @user.update(user_params) 
            flash[:notice] = "更新成功しました"
            redirect_to user_path(current_user) #redirectの場合はnotice
        else
            flash[:alert] ="更新失敗しました" #　renderの場合はalert
            render action: :edit  #editアクションを再度呼び出す
        end
      end

      def edit  
          @user = current_user
      end

      def objective #目標入力編集ページを表示する
          @user = current_user
          #この後に〜を記述
      end


      def renew #目標入力ページを更新する
          @user = current_user
          @user.update(user_params) 
          redirect_to user_path(current_user)
      end

      def quit #ユーザー退会フォームの表示
        @user = current_user
      end

      def clear  #ユーザー論理削除
        @user = current_user
        @user.destroy
        sign_out(current_user)
        redirect_to root_path
      end

      def measurement #測定ページを表示する
        @user = current_user
      end  

      def record #測定結果保存
        @user = current_user
        @user.maintain_calories(user_params, params[:momentum])
        @user.assign_attributes(user_params) #指定モデルの各カラムに値を入れる。ただし保存はまだしない。
        if  @user.save
        redirect_to result_path
        else
        flash[:alert] ="更新失敗しました" #　renderの場合はalert
        render action: :measurement  #editアクションを再度呼び出す
        end

      end

      #測定結果表示
      def result
        @user = current_user
      end

      #ログインユーザーの食事記録を表示する
      def usermealrecord
        @user = current_user
        @mealrecords = Mealrecord.where(user_id: @user.id).created_today
        @graph = Graph.new
      end

      def graph #グラフページを表示する
          #まずログインしているユーザーの今月の
            @graphs = Graph.where(user_id: current_user.id, created_at: Time.now.all_month)
            @graph_days =  @graphs.map{ |graph| graph.created_at.strftime("%d").to_i } #ユーザーが測定した日付一覧。
            @results =  [*1..31] #1~31の配列を作る
            @results.each do |day|
                if @graph_days.include?(day) #配列1~31(day)が測定した日付のユーザーに含まれているかいないかの判定
                  year =  Time.now.strftime("%y").to_i
                  month =  Time.now.strftime("%m").to_i
                  final = DateTime.parse("20#{year}-#{month}-#{day}")
                  @results[day - 1] = @graphs.find_by(created_at: final.in_time_zone.all_day).remaining_calorie #日付をもとに1つのレコードを取得。そのレコードの中のremaining_calorieカラムを取得
                else 
                  @results[day - 1] = 0 
                end
             end
            @results.unshift(0) #配列の最初に0を入れないとnilになってエラーが出るので0を代入
        
      end

    private
    def user_params
        params.require(:user).permit(:nickname, :postal_code, :address, :tel, :email, :objective, :height, :age, :weight, :gender, :result)
    end
  
  end
