extends Node2D

# 스프라이트 - 키 매핑
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
@onready var spt_up = $btnUp/sptUp
@onready var spt_dn = $btnDown/sptDn
@onready var spt_rt = $btnRight/sptRt
@onready var spt_lt = $btnLeft/sptLt

# 현재 입력한 키를 보여주는 노드
@onready var spt_input = $Label/sptInput

# 버튼 노드 참조
@onready var btn_up = $btnUp
@onready var btn_down = $btnDown
@onready var btn_right = $btnRight
@onready var btn_left = $btnLeft

# 현재 리매핑 상태인지 구분하는 변수
var is_input = false

func _ready():
	update_sprites()

# 버튼 클릭 시 호출되는 함수
# 버튼을 클릭하면, 리매핑 상태가 됨.
func _on_btn_up_pressed():
	current_action = "up"
	is_input = true

func _on_btn_down_pressed():
	current_action = "down"
	is_input = true

func _on_btn_right_pressed():
	current_action = "right"
	is_input = true

func _on_btn_left_pressed():
	current_action = "left"
	is_input = true
	
# 키 매핑 변경 및 스프라이트 업데이트 함수
func _input(event):
	if is_input:
		# 리매핑 상태시, 키를 누르면
		if event is InputEventKey and event.pressed:
			# 해당 매핑된 키를 누른 키로 대체한다.
			key_mapping[current_action] = event.physical_keycode
			# 리매핑 상태 종료.
			is_input = false
			update_sprites()
		# 리매핑 상태시, 조이패드 버튼 대응.
		elif event is InputEventJoypadButton and event.pressed:
			key_mapping[current_action] = "joypad_button_" + str(event.button_index)
			is_input = false
			update_sprites()
		# 리매핑 상태가 아니면, (일반 상태라면)
		# 누른 키를 해당 스프라이트에 표시한다.
	else :
		if event is InputEventKey and event.pressed:
			spt_input.frame = key_sprite_map.get(event.physical_keycode)
		
# 스프라이트 업데이트 함수
func update_sprites():	
	spt_up.frame = key_sprite_map.get(key_mapping["up"], -1)
	spt_dn.frame = key_sprite_map.get(key_mapping["down"], -1)
	spt_rt.frame = key_sprite_map.get(key_mapping["right"], -1)
	spt_lt.frame = key_sprite_map.get(key_mapping["left"], -1)
	
