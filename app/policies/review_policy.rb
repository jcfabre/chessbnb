class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true  # Anyone can view a review
  end

  def show?
    true  # Anyone can view a review
  end

  def create?
    true  # Anyone can create a review
  end

  def edit?
    record.review == review  # Only review creator can edit a review
  end

  def update?
    record.review == review # Only review creator can update it
  end

  def destroy?
    record.review == review # Only review creator can delete it
  end
end
