extends Node

onready var player = $Player
onready var turret1 = $Turret
onready var turret2 = $Turret2
#onready var turret3 = $Turret3

func _ready():
	player.initialize(self)
	turret1.initialize(player)
	turret2.initialize(player)
#	turret3.initialize(player)
