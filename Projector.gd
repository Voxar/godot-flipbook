extends SpotLight3D

var timer = Timer.new()

func _ready():
	pass

var time = 0
var tt = 0
func _process(delta):
	time += delta
	if (time < 3): 
		self.light_energy = 0
	elif time < 3.1:
		self.light_energy = 5
	elif time < 3.4:
		self.light_energy = 0
	elif time < 4.3:
		if (tt == 0 or time > tt): 
			self.light_energy = randf_range(1, 10)
			tt = time + randf_range(0.02, 0.1)
	elif time < 5:
		self.light_energy = 20
	update_projection();
	
func update_projection():
	self.light_projector = null;
	self.light_projector = %Viewport.get_texture();
