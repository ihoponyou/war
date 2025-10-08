extends CharacterBody2D

@export var nav_agent: NavigationAgent2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		nav_agent.target_position = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	if nav_agent.is_navigation_finished():
		return
	var next_path_pos := nav_agent.get_next_path_position()
	velocity = global_position.direction_to(next_path_pos) * 100
	move_and_slide()
