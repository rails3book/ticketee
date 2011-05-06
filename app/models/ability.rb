class Ability
  include CanCan::Ability
  
  def initialize(user)
    user.permissions.each do |permission|
      can permission.action.to_sym, permission.thing_type.constantize do |thing|
        thing.nil? ||
        permission.thing_id.nil? ||
        permission.thing_id == thing.id
      end
    end
  end
end