module API

  class UsersController < ApplicationController
    # GET /users
    # GET /users.json
    def index
      authenticate_request!

      @users = User.all

      render json: @users, status: 200
    end

    # GET /users/1
    # GET /users/1.json
    def show
      authenticate_request!

      @user = User.find(params[:id])
      render json: @user
    end

    # POST /users
    # POST /users.json
    def create
      authenticate_request!

      puts params.inspect
      puts 'test'
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: api_user_path(@user)
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      authenticate_request!

      @user = User.find(params[:id])

      if @user.update(user_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      authenticate_request!

      @user = User.find(params[:id])
      @user.destroy

      head :no_content
    end

    #def login
      #@user = User.find_by(email: params[:email])

      #if @user.password == params[:password]
        #render json: {message: "authenticated"}
      #else
        #render json: {message: "no soup for you"}, status: 401
      #end
    #end

    private

    def user_params
     puts params.inspect
      params.require(:api_user).permit(:email, :password)
    end
  end
end