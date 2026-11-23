extends Control

const LEVEL_1 := "res://scenes/level_1.tscn"
const SETTINGS := "res://scenes/settings_menu.tscn"
const SAVE_PATH := "user://savegame.save"

func _ready() -> void:
	%NewGameButton.pressed.connect(_on_new_game_pressed)
	%ContinueButton.pressed.connect(_on_continue_pressed)
	%SettingsButton.pressed.connect(_on_settings_pressed)
	%QuitButton.pressed.connect(_on_quit_pressed)

	# Continue only works if a save exists
	%ContinueButton.disabled = not FileAccess.file_exists(SAVE_PATH)

	# Focus the first enabled button for keyboard/controller
	if %ContinueButton.disabled:
		%NewGameButton.grab_focus()
	else:
		%ContinueButton.grab_focus()

func _on_new_game_pressed() -> void:
	# Later: delete any old save here before starting fresh
	get_tree().change_scene_to_file(LEVEL_1)

func _on_continue_pressed() -> void:
	# Later: load the save file and go to the saved level
	get_tree().change_scene_to_file(LEVEL_1)

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file(SETTINGS)

func _on_quit_pressed() -> void:
	get_tree().quit()
