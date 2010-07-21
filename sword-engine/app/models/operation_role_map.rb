class OperationRoleMap < ActiveRecord::Base
  validates_presence_of :operation_id, :role_id
  validates_uniqueness_of :operation_id, :scope => [ :role_id ]
end
