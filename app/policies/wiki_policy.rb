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

  class Scope
        attr_reader :user, :scope

        def initialize(user, scope)
            @user = user
            @scope = scope
        end

        def resolve
            wikis = []
            if user.nil?
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if wiki.private == false
                        wikis << wiki
                    end
                end
            elsif user.admin?
                wikis = scope.all
            elsif user.premium?
                all_wikis = scope.all
                wikis = []
                collaborators = []
                all_wikis.each do |wiki|
                    wiki.collaborators.each do |collaborator|
                        collaborators << collaborator.email
                    end
                    if wiki.private == false || wiki.user == user || collaborators.include?(user.email)
                        wikis << wiki
                    end
                end
            else
                all_wikis = scope.all
                wikis = []
                collaborators = []
                all_wikis.each do |wiki|
                    wiki.collaborators.each do |collaborator|
                        collaborators << collaborator.email
                    end
                    if wiki.private == false || collaborators.include?(user.email)
                        wikis << wiki
                    end
                end
            end
            wikis
        end
    end
