class Users::GraphsController < ApplicationController


    def create
        @graph = Graph.new(graph_params)
        @graph.user_id = current_user.id
        @graph.save
        redirect_to graph_path(current_user)
    end


    private
    
    def graph_params
        params.require(:graph).permit(:remaining_calorie)
    end


end