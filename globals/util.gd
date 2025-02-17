extends Node

enum Scenes { Title, Game }

var scene_manager: SceneManager

var scene_paths: Dictionary[Scenes, String] = {
	Scenes.Title: "res://menus/title/title.tscn",
	Scenes.Game: "res://scenes/game/game.tscn",
}
