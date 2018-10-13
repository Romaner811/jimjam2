{
	if (keyboard_check(vk_up) or keyboard_check(ord("W"))) {
		self.key_up = 1;
	} else {
		self.key_up = 0;
	}

	if (keyboard_check(vk_down) or keyboard_check(ord("S"))) {
		self.key_down = 1;
	} else {
		self.key_down = 0;
	}

	if (keyboard_check(vk_left) or keyboard_check(ord("A"))) {
		self.key_left = 1;
	} else {
		self.key_left = 0;
	}

	if (keyboard_check(vk_right) or keyboard_check(ord("D"))) {
		self.key_right = 1;
	} else {
		self.key_right = 0;
	}

	if (mouse_check_button(mb_left) or keyboard_check(vk_space)) {
		self.key_attack = true;
	} else {
		self.key_attack = 0;
	}

	self.cursor_x = mouse_x;
	self.cursor_y = mouse_y;
}