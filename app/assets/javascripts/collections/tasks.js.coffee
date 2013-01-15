class TodoApp.Collections.Tasks extends Backbone.Collection

  url: '/api/tasks'

  model: TodoApp.Models.Task

  update_order: (initial_pos, final_pos) ->
    if initial_pos < final_pos
      todos = @models.filter (todo) -> 
        todo.get('priority') <= final_pos and todo.get('priority') != intial_pos
      i = 1
      for todo in todos
        todo.set('priority', i)
        todo.save
        i++
    if initial_pos > final_pos
      todos = @models.filter (todo) -> 
        todo.get('priority') >= final_pos and todo.get('priority') < initial_pos
      i = initial_pos
      for todo in todos
        todo.set('priority', i)
        todo.save
        i--

  completed: ->
    return @filter (todo)->
             return todo.get('completed')

  remaining: ->
    @without.apply( this, @completed )

  comparator: (todo) ->
    return todo.get('order')
