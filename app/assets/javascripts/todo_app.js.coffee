window.TodoApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new TodoApp.Routers.Tasks()
    Backbone.history.start(pushState: true)

$(document).ready ->
  TodoApp.initialize()
