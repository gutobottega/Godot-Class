extends Node2D

var total := 0.0

func _ready() -> void:
	update_core(total)

func _process(delta: float) -> void:
	update_core(total)

func inc_score(num: int) -> void:
	total+= num
	

func update_core(current_score: float) -> void:
	$Score.text = "Score: " + str(int(current_score))


func _on_Timer_timeout() -> void:
	inc_score(1)
