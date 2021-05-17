extends Sprite

onready var gun = $Gun
var speed = 200 #Pixeles

func initialize(projectile_container):
	gun.container = projectile_container

func _physics_process(delta):
	var mouse_position:Vector2 = get_local_mouse_position()
	gun.rotation = mouse_position.normalized().angle()
	
	if Input.is_action_just_pressed("shoot"):
		gun.shoot()
	
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	position.x += direction_optimized * speed * delta




