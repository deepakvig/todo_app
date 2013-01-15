class TodoApp.Models.Task extends Backbone.Model

  defaults: 
    name: '',
    completed: false

  toggle: ->
    @save
      completed: !@get('completed')
