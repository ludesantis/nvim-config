return {
	{
  		"yutkat/confirm-quit.nvim",
  		event = "CmdlineEnter",
  		opts = {
			quit_message = function() 
				local messages = {
    					"Close terminal? Brave choice.",
    					"Sure? The terminal will miss you.",
    					"Exit now and face the consequences?",
    					"Close me? How rude.",
    					"One last command before we go?",
    					"Terminal says: 'Are you sure?' 😭"
				}

				index = math.random(1, #messages)
				return messages[index]
			end
		},
	}
}
