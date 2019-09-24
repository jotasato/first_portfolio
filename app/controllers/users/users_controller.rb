class Users::UsersController < ApplicationController
      
      before_action :authenticate_user!
      before_action :set_user,except: [:show]
    
      
      
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
        if @user.update(user_params) 
            flash[:notice] = "更新成功しました"
            redirect_to user_path(current_user) #redirectの場合はnotice
        else
            flash[:alert] ="更新失敗しました" #　renderの場合はalert
            render action: :edit  #editアクションを再度呼び出す
        end
      end

      def edit  
      end

      def objective #目標入力編集ページを表示する
          #この後に〜を記述
      end


      def renew #目標入力ページを更新する
          @user.update(user_params) 
          redirect_to user_path(current_user)
      end

      def quit #ユーザー退会フォームの表示
      end

      def clear  #ユーザー論理削除
        @user.destroy
        sign_out(current_user)
        redirect_to root_path
      end

      def measurement #測定ページを表示する
      end  

      def record #測定結果保存
        @user.maintain_calories(user_params, params[:momentum])
        @user.assign_attributes(user_params) #指定モデルの各カラムに値を入れる。ただし保存はまだしない。
        if  @user.save(context: :record)
        redirect_to result_path
        else
        flash[:alert] ="更新失敗しました" #　renderの場合はalert
        render action: :measurement  #editアクションを再度呼び出す
        end

      end

      #測定結果表示
      def result
      end

      #ログインユーザーの食事記録を表示する
      def usermealrecord
        if @user.result
          @mealrecords = Mealrecord.where(user_id: @user.id).created_today
          @graph = Graph.new
        else
          redirect_to measurement_path(@user)
        end

          @graphresult = Graph.where(user_id: @user.id, created_at: Time.zone.now.all_day)

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

    def set_user
      @user = current_user
    end
  
  end



 