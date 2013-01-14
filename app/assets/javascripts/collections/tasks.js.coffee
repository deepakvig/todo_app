class TodoApp.Collections.Tasks extends Backbone.Collection

  url: '/api/tasks'

  model: TodoApp.Models.Task
