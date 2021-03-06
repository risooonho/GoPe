extends KinematicBody2D


const SPEED = 55
var direction = Vector2(1,0)
var mouvement = Vector2()

func _ready():
	$enemyArea.connect("body_entered",self,"player_touched")
	pass

func _physics_process(delta):
	if !$enemyArea/right.is_colliding():
		direction.x = -1
	if !$enemyArea/left.is_colliding():
		direction.x = 1 
	mouvement.x = SPEED*direction.x
	if !global.is_pause:
		move_and_slide(mouvement)
	pass
	
func player_touched(body):
	if body.name == "Player":
		global.player_health -= 13
		if global.player_health <= 0:
			body.position = global.check_point
			global.player_lives -= 1
			global.player_health = 100
	pass
