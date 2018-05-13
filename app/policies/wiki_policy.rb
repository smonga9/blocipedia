class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

    def index?
      true
    end

    def show?
      user.standard?
    end

    def create?
      true
    end

    def new?
        create?
    end

    def update?
        user.present?
    end

    def edit?
        update?
    end

    def destroy?
        user.admin? || user.premium?
    end
  end
