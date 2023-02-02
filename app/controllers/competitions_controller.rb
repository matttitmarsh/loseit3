class CompetitionsController < ApplicationController
  include CompetitionsHelper

  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = current_user.competitions.build(competition_params)

    if @competition.save
      flash[:success] = "Competition '#{@competition.title}' created!"
      redirect_to @competition
    else
      flash[:alert] = "Some error!"
      render 'new'
    end
  end
end
