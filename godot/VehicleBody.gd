class_name vehicle extends VehicleBody

const STEER_SPEED = 1
const STEER_LIMIT = 0.5
const FRICTION = 4.5
const TRAVEL = .7
const STIFFNESS = 50

var steer_target = 0

export var engine_force_value = 40

func _ready():
	$VehicleWheel.wheel_friction_slip = FRICTION
	$VehicleWheel2.wheel_friction_slip = FRICTION
	$VehicleWheel3.wheel_friction_slip = FRICTION
	$VehicleWheel4.wheel_friction_slip = FRICTION
	
	$VehicleWheel.suspension_travel = TRAVEL
	$VehicleWheel2.suspension_travel = TRAVEL
	$VehicleWheel3.suspension_travel = TRAVEL
	$VehicleWheel4.suspension_travel = TRAVEL

	$VehicleWheel.suspension_stiffness = STIFFNESS
	$VehicleWheel2.suspension_stiffness = STIFFNESS
	$VehicleWheel3.suspension_stiffness = STIFFNESS
	$VehicleWheel4.suspension_stiffness = STIFFNESS
	pass
	
		
func _physics_process(delta):
	var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	
	steer_target = Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")
	steer_target *= STEER_LIMIT
	
	if Input.is_action_pressed("accelerate"):
		engine_force = engine_force_value
	else:
		engine_force = 0
	
	if Input.is_action_pressed("reverse"):
		if (fwd_mps >= -1):
			engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
	
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
