class WeightRecordsController < ApplicationController
  before_action :authenticate_user!

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

  def edit
    @weight_record = competition.weight_records.find(params[:id])
  end

  def update
    @weight_record = competition.weight_records.find(params[:id])
    respond_to do |format|
      if @weight_record.update(weight_record_params)
        format.html { redirect_to(competition,
          :notice => 'Weight Record was successfully updated!.') }
        format.xml { head :ok }
      else
        format.html {render :action => "edit" }
        format.xml { render :xml => @weight_record.errors,
                      :status => :unprocessessable_entity }
      end
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
