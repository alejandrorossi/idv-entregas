extends Sprite

onready var shoot_position = $FirePosition

export (PackedScene) var projectile_scene:PackedScene

var container:Node

func shoot():
	var new_projectile = projectile_scene.instance()
	container.add_child(new_projectile)
	new_projectile.initialize(
		(shoot_position.global_position - global_position).normalized(),
		 shoot_position.global_position)

