class WeightRecordsController < ApplicationController
  def new
    @weight_record = competition.weight_records.build(
      effective_date: Time.zone.now
    )
  end

  def create
    @weight_record = competition.weight_records.build(weight_record_params)
    @weight_record.user = current_user

    if @weight_record.save
      flash[:success] = "Weight Recorded for '#{@competition.title}'!"
      redirect_to competition_path(competition)
    else
      flash[:alert] = "Unable to create Weight Record!"
      render 'new'
    end
  end

  private

  def competition
    @competition ||= Competition.find(params[:competition_id])
  end

  def weight_record_params
    params.require(:weight_record).permit(:weight, :effective_date)
  end
end
