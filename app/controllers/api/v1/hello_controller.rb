class Api::V1::HelloController < ApplicationController
    def index
         users = User.all
         render json: users.as_json(only: [:id, :name, :email, :created_at]) 
      end

    def show
      user = User.find(params[:id])
      p '-----------------------------'
      p params
      render json: user
    end

end
