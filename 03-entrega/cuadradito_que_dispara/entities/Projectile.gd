extends Node2D

onready var timer = $DeleteTimer
export (float) var speed
var direction:Vector2

#var _parent_container:Node

# I set parent node to reuse at TurretProjectile
func initialize(shoot_direction:Vector2, initial_position:Vector2):
	global_position = initial_position
	direction = shoot_direction
	rotation = direction.normalized().angle() #bullet rotation
	timer.connect("timeout",self,"_on_DeleteTimer_timeout")
	timer.start()


func _physics_process(delta):
	_remove_when_out_of_window()
	position += direction * speed * delta
	
func _remove_when_out_of_window():
	if(position.x > OS.get_window_size().x): 
		queue_free()
	
	
func _on_DeleteTimer_timeout():
	get_parent().remove_child(self)
	queue_free()

