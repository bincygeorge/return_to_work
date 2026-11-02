class PlannerItemsController < ApplicationController
  before_action :set_planner_item, only: [:edit, :update, :destroy]

  def index
    @planner_items = PlannerItem.order(:scheduled_date, :start_time)
  end

  def new
    @planner_item = PlannerItem.new
  end

  def create
    @planner_item = PlannerItem.new(planner_item_params)

    if @planner_item.save
      redirect_to root_path, notice: "Activity added to your planner!"
    else
      render "planner_items/new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    "kkkkkkkkkkkkkkkkkkkkkk   #{planner_item_params}"
    if @planner_item.update(planner_item_params)
      redirect_to root_path, notice: "Activity updated successfully!"
    else
      redirect_to root_path, alert: "Could not update activity."
    end
  end

  def destroy
    @planner_item.destroy
    redirect_to root_path, notice: "Activity deleted successfully!"
  end

  private

  def set_planner_item
    @planner_item = PlannerItem.find(params[:id])
  end

  def planner_item_params
    "kkkkkkkkkkkkkkkkkkkk #{params}"
    params.require(:planner_item).permit(
      :title,
      :description,
      :category,
      :scheduled_date,
      :start_time,
      :end_time,
      :completed
    )
  end
end