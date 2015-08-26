class PersonasController < ApplicationController
  before_action :set_personas, only: :index
  before_action :set_persona, only: [:show, :update, :destroy]

  def index
    respond_with(@personas)
  end

  def show
    respond_with(@persona)
  end

  def create
    @persona = Persona.new(persona_params)
    @persona.save
    respond_with(@persona)
  end

  def update
    @persona.update(persona_params)
    respond_with(@persona)
  end

  def destroy
    @persona.destroy
    respond_with(@persona)
  end

  private
    def set_personas
      @personas = Persona.where(persona_params).order(sort_by).page(params[:page])
    end

    def set_persona
      @persona = Persona.find(params[:id])
    end

    def persona_params
      params.permit(:name, :description, :photo_url)
    end
end