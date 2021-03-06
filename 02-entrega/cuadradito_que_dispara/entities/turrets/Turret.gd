extends Sprite

export (PackedScene) var projectile_scene: PackedScene

var _player:Sprite

onready var fire_position = $FirePosition
onready var shoot_timer = $ShootTimer


#tuve problemas regulando el angulo de las torretas para que apunte bien al jugador
#disparos de torretas giran junto con la torreta :(
#cambié los sprites porque estaba probando y jugando un poco con rotaciones y otros elementos de godot



func initialize(player: Node): 
	
	_player = player
	var new_projectile = projectile_scene.instance()
	self.add_child(new_projectile)
	new_projectile.initialize(player.position, position)


func _physics_process(delta):
	var p = _player.get_global_position()
	rotation = _player.position.normalized().angle()+4.8


func shoot():
	var new_projectile = projectile_scene.instance()
	self.add_child(new_projectile)
	new_projectile.initialize(
		(fire_position.global_position + global_position+ Vector2(-400,800) ).normalized(), 
		fire_position.global_position 
		)
	


func _on_ShootTimer_timeout():
	shoot()
