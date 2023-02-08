class WeightRecordPolicy < ApplicationPolicy
  def edit?
    user_who_can_access_weight_record
  end

  def update?
    user_who_can_access_weight_record
  end

  def destroy?
    user_who_can_access_weight_record
  end

  def user_who_can_access_weight_record
    record.user_id == user.id
  end
end
