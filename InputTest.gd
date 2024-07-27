extends Node2D
var key_sprite_map = {
	"JOY_XBOX_A": 0,
	"JOY_XBOX_B": 1,
	"JOY_XBOX_X": 2,
	"JOY_XBOX_Y": 3,
	"JOY_START": 6,
	"JOY_SELECT": 7,
	Key.KEY_A: 13,
	Key.KEY_B: 14,
	Key.KEY_C: 15,
	Key.KEY_D: 16,
	Key.KEY_E: 17,
	Key.KEY_F: 18,
	Key.KEY_G: 19,
	Key.KEY_H: 20,
	Key.KEY_I: 21,
	Key.KEY_J: 22,
	Key.KEY_K: 23,
	Key.KEY_L: 24,
	Key.KEY_M: 25,
	Key.KEY_N: 26,
	Key.KEY_O: 27,
	Key.KEY_P: 28,
	Key.KEY_Q: 29,
	Key.KEY_R: 30,
	Key.KEY_S: 31,
	Key.KEY_T: 32,
	Key.KEY_U: 33,
	Key.KEY_V: 34,
	Key.KEY_W: 35,
	Key.KEY_X: 36,
	Key.KEY_Y: 37,
	Key.KEY_Z: 38,
	Key.KEY_ENTER: 39,
	Key.KEY_SPACE: 40,
	Key.KEY_ESCAPE: 41,
}

# 키 매핑
var key_mapping = {
	"up": Key.KEY_W,
	"down": Key.KEY_S,
	"left": Key.KEY_A,
	"right": Key.KEY_D,
}

# 현재 설정할 액션 이름
var current_action = ""

# Sprite 노드 참조
@onready var spt_up = $btnUp/sptUP
@onready var spt_dn = $btnDown/sptDn
@onready var spt_rt = $btnright/sptRt
@onready var spt_lt = $btnLeft/sptLt
@onready var spt_input = $Label/sptInput

# 버튼 노드 참조
@onready var btn_up = $btnUp
@onready var btn_down = $btnDown
@onready var btn_right = $btnright
@onready var btn_left = $btnLeft

func _ready():
	btn_up.pressed.connect(self._on_btn_up_pressed)
	btn_down.pressed.connect(self._on_btn_down_pressed)
	btn_right.pressed.connect(self._on_btn_right_pressed)
	btn_left.pressed.connect(self._on_btn_left_pressed)
	update_sprites()

# 버튼 클릭 시 호출되는 함수
func _on_btn_up_pressed():
	current_action = "up"
	show_input_prompt()

func _on_btn_down_pressed():
	current_action = "down"
	show_input_prompt()

func _on_btn_right_pressed():
	current_action = "right"
	show_input_prompt()

func _on_btn_left_pressed():
	current_action = "left"
	show_input_prompt()

# 사용자 입력 대기 상태 표시 함수
func show_input_prompt():
	spt_input.visible = true

# 키 매핑 변경 및 스프라이트 업데이트 함수
func _input(event):
	if spt_input.visible:
		if event is InputEventKey:
			key_mapping[current_action] = event.scancode
			spt_input.visible = false
			update_sprites()
		elif event is InputEventJoypadButton:
			key_mapping[current_action] = "joypad_button_" + str(event.button_index)
			spt_input.visible = false
			update_sprites()

# 스프라이트 업데이트 함수
func update_sprites():
	spt_up.frame = key_sprite_map.get(key_mapping["up"], -1)
	spt_dn.frame = key_sprite_map.get(key_mapping["down"], -1)
	spt_rt.frame = key_sprite_map.get(key_mapping["right"], -1)
	spt_lt.frame = key_sprite_map.get(key_mapping["left"], -1)
