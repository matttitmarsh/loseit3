class CompetitionsController < ApplicationController
  include CompetitionsHelper
  before_action :require_login, except: [:index]

  def index
    @competitions = Competitions.all
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
      flash[:success] = "Competition '#{@competition.name}' created!"
      redirect_to @competition
    else
      flash[:alert] = "Some error!"
      render 'new'
    end
  end
end
