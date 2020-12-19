extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var UP : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	UP.x = 0
	UP.y = 1
	UP.z = 0
	pass # Replace with function body.


func _process(delta):
	# Key Directly
#	if Input.is_key_pressed(KEY_ESC):
#	  $VehicleTest.position = $Course.get_node("StartPosition").position
	pass
	

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			$VehicleTest.translation = $Course.get_node("StartPosition").global_transform.origin
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#print($VehicleTest.transf)
	$Camera.translation = $VehicleTest.translation
	$Camera.translation.y += 4
	$Camera.rotation = $VehicleTest.rotation
	$Camera.rotation_degrees.y += 90
	$Camera.rotation_degrees.x -= 20

	#$Camera.look_at($VehicleTest.translation, UP)
	pass
