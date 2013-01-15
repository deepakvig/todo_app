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
    if task.isCompleted()
      @$('#completed_tasks').append(view.render().el)
    else
      @$('#tasks').append(view.render().el)

  createTask: (event) ->
    event.preventDefault()
    newAttributes = {name: $('#new_task_name').val()}
    @collection.create newAttributes,
      wait: true
      success: -> $('#new_task')[0].reset()
      error: @handleError

  handleError: (task, response) ->
    $('#error').text(response)
