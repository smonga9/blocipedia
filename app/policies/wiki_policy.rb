class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

    def index
      user.standard?
    end

    def show
      user.standard?
    end

    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end

    def create?
        user.admin? || user.premium?
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
