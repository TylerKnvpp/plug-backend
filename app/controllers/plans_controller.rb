class PlansController < ApplicationController

    def index
        plans = Plan.all
        render json: plans
    end
    
    def show
        plan = Plan.find(params[:id])
        render json: plan
    end

    def update
        plan = Plan.find(params[:id])
        plan.update(plan_params)
        render json: plan
    end

    def create
        plan = Plan.create(plan_params)
        render json: plan
    end
    

    private

    def plan_params
        params.require(:plan).permit(:id, :accepted)
    end

end
