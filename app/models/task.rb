class Task < ActiveRecord::Base
  attr_accessible :name
  before_create :set_order

  default_scope order('priority asc, updated_at asc')

  def set_order
    max_priority = Task.all.last.try(:priority) || 0
    self.priority = max_priority + 1   
  end

end
