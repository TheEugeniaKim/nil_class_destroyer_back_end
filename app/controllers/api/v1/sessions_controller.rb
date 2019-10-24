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

    def update
        user = User.find_by(user_id: params[:user])
        session = 
        render json: session
    end 


    def high_score
        sessions = Session.all
        byebug
        sessions = sesssions.map{|session| session.score}
    end

end
