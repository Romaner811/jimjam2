{
	if (not global.game.controls_enabled) {
		return;
	}
	var unit = self;
	
	/*
	show_debug_message("+ unit: " + string(unit));
	show_debug_message("\tkey_shift " + string(unit.key_shift));
	show_debug_message("\tkey_attack " + string(unit.key_attack));
	show_debug_message("\tkey_up " + string(unit.key_up));
	show_debug_message("\tkey_left " + string(unit.key_left));
	show_debug_message("\tkey_down " + string(unit.key_down));
	show_debug_message("\tkey_right " + string(unit.key_right));	
	*/
	
	if (unit.key_up) {
		unit.y -= unit.walking_speed;
	}

	if (unit.key_down) {
		unit.y += unit.walking_speed;
	}

	if (unit.key_left) {
		unit.x -= unit.walking_speed;
	}

	if (unit.key_right) {
		unit.x += unit.walking_speed;
	}
	
	var dir = point_direction(unit.x, unit.y, unit.cursor_x, unit.cursor_y);
	unit.image_angle = dir;
	unit.direction = dir;
	
	if (unit.key_attack) {
		var slash = instance_create_layer(
			self.x, self.y,
			"Effects",
			Damage
		);
		with (slash) {
			slash.owner = unit;
			slash.image_angle = slash.owner.image_angle;
			slash.direction = slash.owner.direction;
		}
	}

	if (unit.key_shift) {
		//show_debug_message("shift");
	}
	
	//draw_arrow(self.x, self.y, self.cursor_x, self.cursor_y, 4);
}