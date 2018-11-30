class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a profile
  end

  def edit?
    record == user # Only user can update its profil
  end

  def update?
    record == user # Only user can update its profil
  end
end


