extends AudioStreamPlayer

var rng = RandomNumberGenerator.new()
var music = [
	"res://audio/music/mars-beat-01.ogg",
	"res://audio/music/mars-beat-02.ogg"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if(Input.is_action_just_pressed("ui_down")):
		seek(180);
	
func _on_finished() -> void:
	var randomSong = load(music[rng.randi_range(0, len(music)-1)]);
	if (stream != randomSong):
		await get_tree().create_timer(5).timeout
	stream = randomSong;
	play()
