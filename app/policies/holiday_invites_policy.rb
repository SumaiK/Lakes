class HolidayInvitesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true
  end

  def update?
    record == user
  end

  def destroy?
    true
  end


end
