extends Node
var list = [
"Word",
"List",
"Abstraction",
"Agile software development",
"Algorithm",
"Apache",
"Argument",
"API",
"Autonomous",
"Binary",
"Bit",
"Boolean",
"Bug",
"Byte",
"camelCase",
"Cloud",
"Command",
"Compiler",
"Crowdsourcing",
"Constants",
"CSS",
"Cybersecurity",
"Database",
"Declaration",
"Debugging",
"Digital footprint",
"DRY",
"Event",
"Exception",
"Framework",
"Fron end",
"Function",
"Git",
"HTML",
"HTTP",
"Input",
"Inheritance",
"Internet",
"Iteration",
"Java",
"JavaScript",
"JSON",
"Linter",
"Linux",
"Linux",
"Loop",
"SQL",
"Null",
"Objects",
"Output",
"very cool word",
"Packets",
"Parameter",
"Persistence",
"Pixel",
"Pointer",
"Postgresql",
"Programming",
"Python",
"Ruby on Rails",
"Runtime",
"Scripts",
"Script kitty",
"Server",
"Sprint",
"Syntax",
"Terminal",
"Token",
"URL",
"UX",
"UI",
"Username",
"Wi-Fi",
]

func gen_prompt(amount:int) -> String:
	var string := ""
	for i in amount:
		var list_index = randi() % list.size()
		if i < amount:
			string += ""
		string += list[list_index]
	return string
