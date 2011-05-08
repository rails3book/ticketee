class State < ActiveRecord::Base
  def to_s
    name
  end
end
