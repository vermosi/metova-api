module API
  class CarsController < ApplicationController
    before_action :set_car, only: [:show, :update, :destroy]

    # GET /cars
    # GET /cars.json
    def index
      authenticate_request!
      @cars = Car.all

      render json: @cars
    end

    # GET /cars/1
    # GET /cars/1.json
    def show
      authenticate_request!
      @car = Car.find(params[:id])
      render json: @car, status: 200
    end

    # POST /cars
    # POST /cars.json
    def create
      authenticate_request!

      @car = Car.new(car_params)

      if @car.save
        render json: @car, status: :created, location: api_user_path(@car)
      else
        render json: @car.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /cars/1
    # PATCH/PUT /cars/1.json
    def update
      authenticate_request!

      @car = Car.find(params[:id])

      if @car.update(car_params)
        head :no_content
      else
        render json: @car.errors, status: :unprocessable_entity
      end
    end

    # DELETE /cars/1
    # DELETE /cars/1.json
    def destroy
      authenticate_request!

      @car = Car.find(params[:id])
      @car.destroy

      head :no_content
    end

    private

      def set_car
        @car = Car.find(params[:id])
      end

      def car_params
        params[:car]
      end
  end
end