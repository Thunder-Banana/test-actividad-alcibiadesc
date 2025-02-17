extends Node2D

@onready var version: Label = $version


func _ready() -> void:
	version.text = "version " + ProjectSettings.get_setting("application/config/version")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("a") or Input.is_action_just_pressed("start"):
		Util.scene_manager.change_2d_scene(Util.Scenes.Game)
