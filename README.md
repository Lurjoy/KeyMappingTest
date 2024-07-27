# Key Remapping with Sprites - Godot 4

This project demonstrates a key remapping system in Godot 4. The system allows users to remap keys and display the current key mappings using sprites. The key mappings can handle both keyboard keys and gamepad buttons.

## Features

- **Key Remapping:** Allows users to remap keys for different actions.
- **Sprite Indication:** Displays the currently mapped key using a sprite.
- **Supports Keyboard and Gamepad:** Handles input from both keyboard and gamepad.

## Key Sprite Mapping

The sprites for keys are stored in a single sprite sheet, and the frame for each key is mapped as follows:

```gdscript
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
```

## How to Use

### Setup

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/yourusername/key-remapping-godot4.git
    cd key-remapping-godot4
    ```

2. **Open the Project in Godot:**
    Open Godot Engine, click on `Import`, and select the project.godot file in the cloned repository.

### Key Remapping

1. **Remap Keys:**
    - Click on the button corresponding to the action you want to remap (up, down, left, right).
    - Press the new key or gamepad button you want to assign to that action.

2. **Display Current Key:**
    - Press any key or gamepad button to see the corresponding sprite update in the label.

### Code Explanation

- **Key Mapping Dictionary:**
    The key mappings are stored in a dictionary where the key is the action name, and the value is the physical key code.

    ```gdscript
    var key_mapping = {
        "up": Key.KEY_W,
        "down": Key.KEY_S,
        "left": Key.KEY_A,
        "right": Key.KEY_D,
    }
    ```

- **Sprite Update:**
    The `update_sprites()` function updates the sprites based on the current key mappings.

    ```gdscript
    func update_sprites():    
        spt_up.frame = key_sprite_map.get(key_mapping["up"], -1)
        spt_dn.frame = key_sprite_map.get(key_mapping["down"], -1)
        spt_rt.frame = key_sprite_map.get(key_mapping["right"], -1)
        spt_lt.frame = key_sprite_map.get(key_mapping["left"], -1)
    ```

- **Input Handling:**
    The `_input(event)` function handles user input and updates the key mappings or the display sprite.

    ```gdscript
    func _input(event):
        if is_input:
            if event is InputEventKey and event.pressed:
                key_mapping[current_action] = event.physical_keycode
                is_input = false
                update_sprites()
            elif event is InputEventJoypadButton and event.pressed:
                key_mapping[current_action] = "joypad_button_" + str(event.button_index)
                is_input = false
                update_sprites()
        else:
            if event is InputEventKey and event.pressed:
                spt_input.frame = key_sprite_map.get(event.physical_keycode, -1)
    ```

## Contributing

Feel free to fork this repository, make improvements, and submit pull requests. Any contributions to improve the project are welcome!

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For any questions or suggestions, please open an issue on the GitHub repository.
