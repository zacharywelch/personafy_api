class GoalsController < ApplicationController
  before_action :set_persona
  before_action :set_goals, only: :index
  before_action :set_goal, only: [:show, :update, :destroy]

  def index
    respond_with(@goals)
  end

  def show
    respond_with(@goal)
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.save
    respond_with(@goal)
  end

  def update
    @goal.update(goal_params)
    respond_with(@goal)
  end

  def destroy
    @goal.destroy
    respond_with(@goal)
  end

  private
    def set_goals
      @goals = @persona.goals.where(filter_params).order(sort_by).page(params[:page])
    end

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def filter_params
      params.permit(:description, :persona_id)
    end

    def goal_params
      params.require(:goal).permit(:description, :persona_id)
    end

    def set_persona
      @persona = Persona.find(params[:persona_id]) if params[:persona_id]
    end
end
