class CampersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response

    # GET /campers
    def index
        all_campers = Camper.all
        render json: all_campers
    end

    # GET /campers/:id
    def show
        camper = find_camper
        if camper
            render json: camper, include: ["activities"]
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    # POST /campers
    def create
        new_camper = Camper.create!(camper_params)

        render json: new_camper, status: :created
    end


    private
    def camper_params
        params.permit(:name, :age)
    end

    def find_camper
        Camper.find_by(id: params[:id])
    end

    def render_unprocessable_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end


end
