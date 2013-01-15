class TodoApp.Collections.Tasks extends Backbone.Collection

  url: '/api/tasks'

  model: TodoApp.Models.Task

  completedTasks: ->
    @filter (task)->
      task.isCompleted()

  incompleteTasks: ->
    @reject (task) ->
      task.isCompleted()

  comparator: (todo) ->
    return todo.get('order')
