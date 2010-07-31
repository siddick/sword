module Sword
#  class Hash < ::Hash
#    def method_missing( action, *keys )
#      self[action]
#    end
#  end
end

Hash.class_eval do
  def method_missing( action, *keys )
    self[action]
  end
end
