extends CharacterBody3D

var speed = 2.0
var max_health = 10
var health = 10

func start(xform):
	transform = xform
	velocity = (-xform.basis.z * speed).rotated(Vector3.UP, randf_range(-PI/4, PI/4))
	
func _physics_process(delta):
	velocity.y -= 10 * delta
	move_and_slide()
	if transform.origin.y < -50:
		queue_free()


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		health -= 1
		$HealthBar3D.update_health(health, max_health)
		if health <= 0:
			queue_free()
