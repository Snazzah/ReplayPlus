extends "res://modloader/MLMainHook.gd"

onready var _replayplus_tl = load("res://ReplayPlus/Timeline.tscn").instance()
onready var _replayplus_rr = load("res://ReplayPlus/ReplayReader.gd").new()

func _ready():
	call_deferred("_replayplus_init")

func _replayplus_init():
	var main = get_tree().get_root().get_node("Main")
	main.add_child(_replayplus_rr)
	var game_ui = main.get_node("UILayer/GameUI")
	game_ui.add_child(_replayplus_tl)
	_replayplus_tl.hide()
	game_ui.get_node("TopInfo").text += " - T: Toggle Timeline"
	game_ui.get_node("TopInfoReplay").text += " - T: Toggle Timeline"
