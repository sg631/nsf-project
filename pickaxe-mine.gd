extends StaticBody3D
#
## Variables and constants
#var target_position = Vector3(0, 0, 0)
#var mdt = MeshDataTool.new()
#var terrain_mesh_instance: MeshInstance3D
#var delta = 0.1  # Adjust this value to control the depth of the dent
#var ray_length = 100.0  # Length of the ray for detecting terrain
#
#func _ready():
	## Ensure the mesh instance is assigned
	#terrain_mesh_instance = get_child(0)  # Assumes the MeshInstance3D is the first child
	#var mesh = terrain_mesh_instance.mesh
#
	#if not mesh:
		#push_error("Mesh is not assigned to the MeshInstance3D node.")
		#return
	#
	#mdt.create_from_surface(mesh, 0)
#
#func _input(event):
	## Check for left mouse button click
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		## Cast a ray from the camera to detect where the player clicked
		#var camera = get_viewport().get_camera_3d()
		#if camera:
			#var from = camera.project_ray_origin(event.position)
			#var to = from + camera.project_ray_normal(event.position) * ray_length
#
			#var space_state = get_world_3d().direct_space_state
			#var result = space_state.intersect_ray(from, to)
#
			#if result and result.collider == self:
				#target_position = result.position
				#create_dent_at_position(target_position)
#
#func create_dent_at_position(position: Vector3):
	#var points = get_vertex_id(mdt, position)
	#for i in points:
		## Create a dent by moving vertices downwards
		#mdt.set_vertex(i, mdt.get_vertex(i) + Vector3(0, -delta, 0))
	#
	## Update normals to fix shadow issues
	#for face in range(mdt.get_face_count()):
		#var vertex = mdt.get_face_vertex(face, 0)
		#var normal = mdt.get_face_normal(face)
		#mdt.set_vertex_normal(vertex, normal)
	#
	## Apply changes to the mesh
	#var mesh = terrain_mesh_instance.mesh
	#mesh.clear_surfaces()
	#mdt.commit_to_surface(mesh)
#
#func get_vertex_id(mdt: MeshDataTool, position: Vector3) -> Array:
	#var ids = []
	#for i in range(mdt.get_vertex_count()):
		#var vertex_pos = mdt.get_vertex(i)
		#if vertex_pos.distance_to(position) < 1.0:  # Adjust the range threshold
			#ids.append(i)
	#return ids
