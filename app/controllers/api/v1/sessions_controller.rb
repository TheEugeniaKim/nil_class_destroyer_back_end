class Api::V1::SessionsController < ApplicationController
    
    def index
        sessions = Session.all 
        render json: sessions
    end

    def create 
        user = User.find_by(username: params[:user])
        session = Session.new({user_id: user.id, score: "0"})
        if user 
            session.save 
            render json: session 
        else
            flash[:message] = "Please Login First"
        end
        
    end

    def show
        session = Session.find(params[:id])
        render json: session 
    end

    def update
        session = Session.find(params["id"])
        session.update(score: params["score"])
        render json: session
    end 


    # def high_score
    #     sessions = Sessions.all.sortby{|session| session.score}
    #     byebug
    # end
    
end
