class GamePolicy < ApplicationPolicy

  def destroy?
    record.user == user
  end



  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
