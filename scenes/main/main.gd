class_name SceneManager extends Node

@export var world: Node2D
@export var gui: Control

var current_scene: Node2D
var current_gui_scene: Control


func _ready() -> void:
	Util.scene_manager = self
	change_2d_scene(Util.Scenes.Title)


func change_gui_scene(scene: Util.Scenes, delete: bool = true, keep_running: bool = false) -> void:
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free()
		elif keep_running:
			current_gui_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)
	var new_child = load(Util.scene_paths[scene]).instantiate()
	gui.add_child(new_child)
	current_gui_scene = new_child


func change_2d_scene(scene: Util.Scenes, delete: bool = true, keep_running: bool = false) -> void:
	if current_scene != null:
		if delete:
			current_scene.queue_free()
		elif keep_running:
			current_scene.visible = false
		else:
			world.remove_child(current_scene)
	var new_child = load(Util.scene_paths[scene]).instantiate()
	world.add_child(new_child)
	current_scene = new_child
