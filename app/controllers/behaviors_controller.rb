class BehaviorsController < ApplicationController
  before_action :set_persona
  before_action :set_behaviors, only: :index
  before_action :set_behavior, only: [:show, :update, :destroy]

  def index
    respond_with(@behaviors)
  end

  def show
    respond_with(@behavior)
  end

  def create
    @behavior = Behavior.new(behavior_params)
    @behavior.save
    respond_with(@behavior)
  end

  def update
    @behavior.update(behavior_params)
    respond_with(@behavior)
  end

  def destroy
    @behavior.destroy
    respond_with(@behavior)
  end

  private
    def set_behaviors
      @behaviors = @persona.behaviors.where(filter_params).order(sort_by).page(params[:page])
    end

    def set_behavior
      @behavior = Behavior.find(params[:id])
    end

    def filter_params
      params.permit(:description, :persona_id)
    end

    def behavior_params
      params.require(:behavior).permit(:description, :persona_id)
    end

    def set_persona
      @persona = Persona.find(params[:persona_id]) if params[:persona_id]
    end
end
