extends TextureRect

var onArea: bool
var dialoguePart = 0
var texts = ["null", "1", "2", "4", "<-----------"]
var finishDialogue1: bool

onready var holeM = get_node("/root/Water 1/HoleM")
onready var holeL = get_node("/root/Water 1/HoleL")

func _ready():
	$dbox.visible = false
	finishDialogue1 = false
func _on_Area2D_body_entered(body):
	if body == $"../Platform Plyr":
		$dbox.visible = true
		onArea = true

func _on_Area2D_body_exited(body):
	if body == $"../Platform Plyr":
		$dbox.visible = false
		onArea = false
		
func ShowDialogue():
	if onArea == true:
		if Input.is_action_just_pressed("select"):
			$"Dialogue 1".visible = true
			if dialoguePart == len(texts) - 2:
				$"Dialogue 1/AnimatedSprite".visible = false
			if dialoguePart == len(texts) - 1:
				finishDialogue1 = true
				dialoguePart = 0
				if holeM.visible == true:
					holeM.visible = false
					holeL.visible = true
				$"Dialogue 1/AnimatedSprite".visible = true
				$"Dialogue 1".visible = false
			else:
				dialoguePart += 1
				$"Dialogue 1/Label".text = str(texts[dialoguePart])
	else:
		$"Dialogue 1".visible = false
		dialoguePart = 0

func _process(_delta):
	ShowDialogue()
