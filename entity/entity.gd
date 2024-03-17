extends CharacterBody2D

@export var speed: float = 100.0

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	nav_agent.path_desired_distance = 4.0
	nav_agent.target_desired_distance = 4.0
	
	set_physics_process(false)
	await get_tree().process_frame
	set_physics_process(true)

func _physics_process(_delta):
	nav_agent.target_position = get_global_mouse_position()
	
	if nav_agent.is_navigation_finished():
		return
	
	var next_position: Vector2 = nav_agent.get_next_path_position()
	velocity = global_position.direction_to(next_position) * speed
	move_and_slide()


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()
