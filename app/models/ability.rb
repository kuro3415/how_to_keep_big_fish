# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # 管理者じゃなかったらこのメソッドを抜ける
    return unless user && user&.admin?

    # 管理者画面のアクセス許可
    can :access, :rails_admin
    # 管理権限許可
    can :manage, :all
  end
end
