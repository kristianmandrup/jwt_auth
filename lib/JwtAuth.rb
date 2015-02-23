require "JwtAuth/version"
module JwtAuth 
  require 'jwt'
  class TokenValidator
    def initialize(token)
      @token = token
    end

    def valid_jwt_token?
       user_identifier == token_identifier if decoded_data.present?
    end

    def user_identifier
      user.email
    end

    def token_identifier
       decoded_data.first[user_id.to_s]
    end

    def user
       @user ||= User.find_by_id(user_id)
    end

    def user_id
      @user_id ||= decoded_data.first.keys.first.to_i
    end

    def decoded_data
       JWT.decode(@token, nil, false) rescue ""
    end
  end

  class UserAuthValidator
    require 'jwt'
    def initialize(auth_params)
      @auth_params = auth_params
    end

    def get_token
      get_token_params if user
    end

    def get_token_params
      { "token" => generate_valid_tokens(@user), "username" => @user.email }
    end

    def user
      @user = User.find_or_create_by(@auth_params)
    end

    def generate_valid_tokens(user)
      JWT.encode(user_data, "secret")
    end

    def user_data
      { @user.id.to_s => @user.email.to_s }
    end
  end
end
