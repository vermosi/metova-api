module API
  class GaragesController < ApplicationController
    before_action :set_garage, only: [:show, :update, :destroy]

    # GET /garages
    # GET /garages.json
    def index
      authenticate_request!

      @garages = Garage.all

      render json: @garages
    end

    # GET /garages/1
    # GET /garages/1.json
    def show
      authenticate_request!

      @garage = Garage.find(params[:id])
      render json: @garage
    end

    # POST /garages
    # POST /garages.json
    def create
      authenticate_request!

      @garage = Garage.new(garage_params)

      if @garage.save
        render json: @garage, status: :created, location: api_user_path(@garage)
      else
        render json: @garage.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /garages/1
    # PATCH/PUT /garages/1.json
    def update
      authenticate_request!

      @garage = Garage.find(params[:id])

      if @garage.update(garage_params)
        head :no_content
      else
        render json: @garage.errors, status: :unprocessable_entity
      end
    end

    # DELETE /garages/1
    # DELETE /garages/1.json
    def destroy
      authenticate_request!

      @garage = Garage.find(params[:id])
      @garage.destroy

      head :no_content
    end

    private

      def set_garage
        @garage = Garage.find(params[:id])
      end

      def garage_params
        params[:garage]
      end
  end
end