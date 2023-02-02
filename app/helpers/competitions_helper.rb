module CompetitionsHelper
  def competition_params
    params.require(:competition).permit(:title, :start_date, :finish_date, :user_id)
  end
end
