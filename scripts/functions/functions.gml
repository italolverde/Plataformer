function controlsetup() {
	jumpBufferTime = 5
	jumpKeyBuffered = 0
	jumpKeyBufferTimer = 0
}


function movement_inputs(){
	rightKey = keyboard_check(ord("D")) + gamepad_button_check(0, gp_padr);
	rightKey = clamp(rightKey, 0, 1);

	leftKey = keyboard_check(ord("A")) + gamepad_button_check(0, gp_padl);
	leftKey = clamp(leftKey, 0, 1);
	
	jumpKeyPressed = gamepad_button_check_pressed(0, gp_face1) + keyboard_check_pressed(vk_space);
	jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
	
	jumpKey = gamepad_button_check(0, gp_face1) + keyboard_check(vk_space);
	jumpKey = clamp(jumpKey, 0, 1);
	
	// Buffer jump key
	if jumpKeyPressed {
		jumpKeyBufferTimer = jumpBufferTime
	}
	if jumpKeyBufferTimer > 0 {
		jumpKeyBuffered = 1
		jumpKeyBufferTimer--
	} else {
		jumpKeyBuffered = 0
	}
}