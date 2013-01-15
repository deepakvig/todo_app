class TodoApp.Models.Task extends Backbone.Model

  defaults: 
    name: '',
    completed: false

  toggle: ->
    @save
      completed: !@get('completed')

  validate: (attributes) ->
    mergedAttributes = _.extend(_.clone(@attributes), attributes)
    if !mergedAttributes.name or mergedAttributes.name.trim() == ''
      return "Task name must not be blank"

  markComplete: ->
    @set completed: true

  markIncomplete: ->
    @set completed: false

  isCompleted: ->
    @get 'completed'
