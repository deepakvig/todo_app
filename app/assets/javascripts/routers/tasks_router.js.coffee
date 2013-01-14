class TodoApp.Routers.Tasks extends Backbone.Router
  routes: 
    '': 'index'

  initialize: ->
    @collection = new TodoApp.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new TodoApp.Views.TasksIndex(collection: @collection)
    $("#tasks").html(view.render().el)
