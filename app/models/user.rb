class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :validatable,
                    :omniauthable
            include DeviseTokenAuth::Concerns::User
        #     devise :database_authenticatable, :registerable,
        #             :recoverable, :rememberable, :trackable, :validatable,
        #             :confirmable, :omniauthable
        #     include DeviseTokenAuth::Concerns::User
#         before_create :skip_confirmation!

#   # Confirmableモジュールを使用している場合、確認をスキップするコールバックを追加
#         def skip_confirmation!
#         self.confirmed_at = Time.now
#         end
   
  end
