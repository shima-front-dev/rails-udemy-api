class Api::V1::RegistrationController < ApplicationController

    def create
        user = User.new(email: params[:email], password: params[:password], name: params[:name])
        # confirmed_atに現在のタイムスタンプを設定
        # user.confirmed_at = Time.now
        if user.save
          @resource = user # @resourceにuserを設定
          set_token_info # set_token_infoメソッドを呼び出す
          render json: '登録成功'
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end


    private
      def sign_up_params
        params.permit(:email, :password, :password_confirmation, :name)
      end

      def set_token_info
        return unless @resource.persisted?
    
        token = @resource.create_new_auth_token
        response.set_header('access-token', token['access-token'])
        response.set_header('client', token['client'])
      end
end
