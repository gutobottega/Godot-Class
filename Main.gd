extends Node2D


var total : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout",self,"update_score")
	timer.start()
	
func update_score() -> void:
	total += 1
	$Score.text = str(total)
