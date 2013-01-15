class TodoApp.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click .destroy': 'clear' 
    'click .toggle': 'toggleCompleted' 
    'drop': 'drop'

  initialize: ->
    @model.on('change', @render, this)    
    @model.on('destroy', @remove, this)    

  render: ->
    $(@el).html(@template(task: @model))
    this
    
  toggleCompleted: ->
    @model.toggle()

  drop: (event, index) ->
    @model.collection.update_order(@model.get('priority'), index+1)
    if @model.get('priority') != index+1
      @model.set('priority', index+1)
      @model.save()

  clear: ->
    @model.destroy()

  remove: ->
    $(@el).remove()
