class TodoApp.Routers.Tasks extends Backbone.Router
  routes: 
    '': 'index'

  initialize: ->
    @collection = new TodoApp.Collections.Tasks()
    @collection.reset($('#container').data('tasks'))
  
  index: ->
    view = new TodoApp.Views.TasksIndex(collection: @collection)
    $("#container").html(view.render().el)
