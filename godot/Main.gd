class_name Main
extends Spatial


var UP : Vector3


func _ready():
	UP.x = 0
	UP.y = 1
	UP.z = 0
	pass # Replace with function body.


func _process(delta):
	# Key Directly
#	if Input.is_key_pressed(KEY_ESC):
#	  VehicleTest.position = $Course.get_node("StartPosition").position
	pass
	

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			$VehicleBody.translation = $Course.get_node("StartPosition").global_transform.origin
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$Camera.translation = $VehicleBody.translation
	$Camera.translation.y += 6
	#$Camera.translation.x -= 14
	
	$Camera.rotation = $VehicleBody.rotation
	$Camera.rotation_degrees.y += 90
	$Camera.rotation_degrees.x -= 20

	#$Camera.look_at($VehicleBody.translation, UP)
	pass
