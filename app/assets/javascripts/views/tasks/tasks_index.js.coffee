class TodoApp.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #new_task': 'createTask'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTask, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    this

  appendTask: (task) =>
    view = new TodoApp.Views.Task(model: task)
    @$('#tasks').append(view.render().el)

  createTask: (event) ->
    event.preventDefault()
    attributes = name: $('#new_task_name').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new_task')[0].reset()
      error: @handleError

  handleError: (task, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
