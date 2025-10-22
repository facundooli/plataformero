extends Node2D

var puntaje = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_moneda_body_entered(body: Node2D) -> void:
	puntaje = puntaje + 1
	print(puntaje)


func _on_estrella_body_entered(body: Node2D) -> void:
	puntaje = puntaje + 10
	print(puntaje)
