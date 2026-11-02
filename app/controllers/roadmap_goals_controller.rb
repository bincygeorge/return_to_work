class RoadmapGoalsController < ApplicationController
    def index
      @roadmap_goals = RoadmapGoal.order(created_at: :desc)

      quotes = [
        {
          text: "Small steps every day lead to big changes.",
          author: "A gentle reminder"
        },
        {
          text: "Your career break is part of your story, not the end of it.",
          author: "A reminder for your journey"
        },
        {
          text: "You do not have to be perfect to begin again.",
          author: "A gentle reminder"
        },
        {
          text: "Progress, not perfection.",
          author: "A reminder for today"
        },
        {
          text: "Believe in the experience you already bring.",
          author: "A reminder for your journey"
        },
        {
          text: "Every expert was once a beginner.",
          author: "A gentle reminder"
        },
        {
          text: "Your next chapter can start with one small step.",
          author: "Return to Work"
        }
      ]

      @daily_quote = quotes[Date.current.yday % quotes.length]
      @week_start = Date.current.beginning_of_week(:monday)
      @week_end = @week_start + 6.days

      @planner_items = PlannerItem
                         .where(scheduled_date: @week_start..@week_end)
                         .order(:scheduled_date, :start_time)
      @total_activities = @planner_items.count
      @completed_activities = @planner_items.where(completed: true).count

      @progress_percentage =
        if @total_activities.zero?
          0
        else
          (@completed_activities.to_f / @total_activities * 100).round
        end
    end

  def new
    @roadmap_goal = RoadmapGoal.new
  end
  def create
    @roadmap_goal = RoadmapGoal.new(roadmap_goal_params)

    if @roadmap_goal.save
      redirect_to roadmap_goals_path, notice: "Career goal created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @roadmap_goal = RoadmapGoal.find(params[:id])
  end
  def update
    @roadmap_goal = RoadmapGoal.find(params[:id])

    if @roadmap_goal.update(roadmap_goal_params)
      redirect_to roadmap_goals_path, notice: "Career goal updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @roadmap_goal = RoadmapGoal.find(params[:id])
    @roadmap_goal.destroy

    redirect_to roadmap_goals_path,
                notice: "Career goal deleted successfully."
  end

  private

  def roadmap_goal_params
    params.require(:roadmap_goal).permit(
      :title,
      :description,
      :category,
      :status,
      :target_date
    )
  end

end
