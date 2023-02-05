class CompetitionsController < ApplicationController
  include CompetitionsHelper
  before_action :authenticate_user!

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

  def edit
    @competition = Competition.find(params[:id])
  end

  def update
    @competition = Competition.find(params[:id])
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to(@competition,
          :notice => 'Competition was successfully updated!.') }
        format.xml { head :ok }
      else
        format.html {render :action => "edit" }
        format.xml { render :xml => @competition.errors,
                      :status => :unprocessessable_entity }
      end
    end
  end

  private

  helper_method def earliest_and_latest_weight_record_by_user
    @earliest_and_latest_weight_record_by_user || begin
     @competition.weight_records.preload(:user).default_order.group_by(&:user).map do |user, weight_records|
      [
        user,
        {
          earliest: weight_records.last,
          latest: weight_records.first
        }
      ]
     end.to_h
    end
  end
end
