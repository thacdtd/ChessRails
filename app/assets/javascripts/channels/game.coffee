App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
    @printMessage("Waiting for opponent...")

  received: (data) ->
    switch data.action
      when "game_start"
        App.board.position("start")
        App.board.orientation(data.msg)
        @printMessage("Game started! You play as #{data.msg}.")
        alert "game start"
      when "make_move"
        [source, target] = data.msg.split("-")
        console.log source
        alert "move 1"
        App.chess.move
          from: source
          to: target
          promotion: "q"
        alert "move 2"
        App.board.position(App.chess.fen())
      when "opponent_forfeits"
        @printMessage("Opponent forfeits. You win!")

  printMessage: (message) ->
    $("#messages").append("<p>#{message}</p>")
