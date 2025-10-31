extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var  modificador_salto = 1
var salto_terminado = true
var vidas = 2
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		salto_terminado = true

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY * modificador_salto
		$AnimatedSprite2D.play("salto")
		salto_terminado = false
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("izquierda", "derecha")
	if direction:
		if direction == 1:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	
		velocity.x = direction * SPEED
		if salto_terminado:
			$AnimatedSprite2D.play("caminar")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if salto_terminado:
			$AnimatedSprite2D.play("quieto")

	move_and_slide()


func _on_salto_body_entered(body: Node2D) -> void:
	modificador_salto = 2
	$temporizadorpowerupssalto.start()





func _on_temporizadorpowerupssalto_timeout() -> void:
	modificador_salto = 1 


func _on_pinche_body_entered(body: Node2D) -> void:
	if body == self: 
		vidas = vidas - 1
	if vidas == 0:
		get_tree().quit()
	
