extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = 1000
export (int) var gravity = 3000

var velocity = Vector2.ZERO
onready var sprite = $Sprite

func get_8way_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")

	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	elif velocity.y > 0:
		sprite.play("down")
	elif velocity.y < 0:
		sprite.play("up")
	else:
		sprite.stop()
		sprite.frame = 0

	velocity = velocity.normalized() * speed


func get_side_input():
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.x *= speed
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	else:
		sprite.stop()
		sprite.frame = 0
		
	if is_on_floor() and Input.is_action_just_pressed('jump'):
		velocity.y = -jump_speed

func _physics_process(delta):
	#get_8way_input()
	velocity.y += gravity * delta
	get_side_input()
	velocity = move_and_slide(velocity, Vector2.UP)
