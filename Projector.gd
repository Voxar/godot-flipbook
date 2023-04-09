extends SpotLight3D

var timer = Timer.new()

func _ready():
	timer.connect("timeout", self.timeout)
	timer.wait_time = 0.1;
	timer.one_shot = false
	add_child(timer)
	timer.start()

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
	
func timeout():
	var vpt = ($"../Viewport" as SubViewport)
	vpt.set_process(true)
	vpt.set_update_mode(SubViewport.UPDATE_ALWAYS)
	var tex = vpt.get_texture();
	self.set_process(true)
	self.light_projector = tex;
	var b = $"../World/Node/Node3D/CSGBox3D4"
	

