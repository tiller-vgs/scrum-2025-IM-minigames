extends Node
var list = [
"word",
"list",
]

func gen_prompt(amount:int) -> String:
	var string := ""
	for i in amount:
		var list_index = randi() % list.size()
		if i < amount:
			string += ""
		string += list[list_index]
	return string
