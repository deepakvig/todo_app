window.TodoApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new TodoApp.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  TodoApp.initialize()
