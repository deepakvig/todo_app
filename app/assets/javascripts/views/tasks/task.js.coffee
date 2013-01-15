class TodoApp.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click .destroy': 'clear' 
    'click .toggle': 'toggleCompleted' 
    'drop': 'drop'
    'click input.is-done': 'markComplete'
    'dblclick label': 'edit'
    'keypress input[type="text"]': 'updateOnEnter'

  initialize: ->
    @model.on('change', @render, this)    
    @model.on('destroy', @remove, this)    

  render: ->
    $(@el).html(@template(task: @model))
    this

  edit: ->
    if !@model.get('completed')
      @$('label').addClass('hidden')
      @$('input[type="text"]').removeClass('hidden')

  markComplete: ->
    if @$('.is-done').prop('checked')
      @model.markComplete()
    else
      @model.markIncomplete()
    @model.save()    

  toggleCompleted: ->
    @model.toggle()

  drop: (event, index) ->
    @model.set('priority', index+1)
    @model.save()

  clear: ->
    @model.destroy()

  remove: ->
    $(@el).remove()

  updateOnEnter: (e) ->
    if e.which == 13 
      @$('input[type="text"]').addClass('hidden')
      @$('label').removeClass('hidden')
      if @model.get('name') != @$('input[type="text"]').val()
        @model.set('name', @$('input[type="text"]').val())
        @model.save()

