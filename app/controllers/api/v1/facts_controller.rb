class Api::V1::FactsController < ApplicationController
  before_action :set_fact, only: [:show, :update, :destroy]

  def index
    @facts = Fact.all
    render json: @facts
  end

  def show
    render json: @fact
  end

  def create
    @fact = Fact.new(fact_params)
    if @fact.save
      render json: @fact
    else
      render error: { error: "Unable to create fact" }, status: 400
    end
  end

  def update
    @fact = Fact.find(params[:id])
    if @fact.update(fact_params)
      # @fact.update(fact_params)
      render json: { message: "Fact updated successfully" }, status: 200
    else
      render json: { error: "Unable to update fact" }, status: 400
    end
  end

  def destroy
    if @fact
      @fact.destroy
      render json: { message: "Fact deleted successfully" }, status: 200
    else
      render json: { error: "Unable to delete fact" }, status: 400
    end
  end

  private

  def set_fact
    @fact = Fact.find(params[:id])
  end

  def fact_params
    params.permit(:fact, :likes, :user_id)
  end
end
