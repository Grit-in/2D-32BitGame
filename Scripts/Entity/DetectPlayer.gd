extends Area2D
class_name PlayerDetector

var in_area : bool


func _on_area_entered(area):
	print("usao")



func _on_area_exited(area):
	print("izasao")


func _on_body_entered(body):
	print("usao")


func _on_body_exited(body):
	print("izasao")
