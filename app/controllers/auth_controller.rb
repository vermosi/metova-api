class AuthController < ActionController::API
    require 'auth_token'
    def authenticate
        user = User.find_by_credentials(params[:name], params[:email])
        if user
            render json: authentication_payload(user)
        else
          render json: { errors: ['Invalid username or password'] }, status: :unauthorized
        end
    end

private

def authentication_payload(user)
    return nil unless user && user.id
    {
        auth_token: AuthToken.encode({ user_id: user.id }),
        user: { id: user.id, username: user.name, email: user.email }
    }
    end
end