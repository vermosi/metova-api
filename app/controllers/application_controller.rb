class ApplicationController < ActionController::API
    #protect_from_forgery with: :null_session

  include ActionController::Serialization
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

    serialization_scope :view_context

    def default_serializer_option
        {root: false}
    end

    #def token
        #authenticate_with_http_basic do |email, password|
            #user = User.find_by(email: email)
            #if user && user.password == password
                #render json: {token: user.auth_token}
            #else
                #render json: {error: 'Incorrect credentials'}
            #end
       # end
   # end

protected

    def current_user
        OpenStruct.new(admin?: true)
    end
    helper_method :current_user
end
