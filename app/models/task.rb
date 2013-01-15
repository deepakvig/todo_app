class Task < ActiveRecord::Base
  attr_accessible :name, :completed, :priority

  default_scope order('priority asc')
  scope :incompleteTasks, where(:completed => false).order('priority asc')

  def self.update_priority(start, last)
    if start != last
      if start < last
        Task.incompleteTasks.where(:priority => (start+1..last)).each {|task| task.update_attribute(:priority , task.priority - 1)}
      else
        Task.incompleteTasks.where(:priority => (last..start-1)).each {|task| task.update_attribute(:priority , task.priority + 1)}
      end
    end
  end


end
