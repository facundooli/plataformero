extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var  modificador_salto = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY * modificador_salto

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("izquierda", "derecha")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_salto_body_entered(body: Node2D) -> void:
	modificador_salto = 2
	$temporizadorpowerupssalto.start()





func _on_temporizadorpowerupssalto_timeout() -> void:
	modificador_salto = 1 
