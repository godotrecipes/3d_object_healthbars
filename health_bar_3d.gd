extends Sprite3D

func _ready():
	texture = $SubViewport.get_texture()
	
func update_health(_value, max_value):
	$SubViewport/HealthBar2D.update_health(_value, max_value)
