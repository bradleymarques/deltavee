class SystemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      System.all
    end
  end
end
