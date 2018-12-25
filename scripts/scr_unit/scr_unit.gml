{
	var command = argument[0];
	
	switch(command) {
		case "init":
			var unit = argument[1];
			
			unit.class = argument[2];
			unit.control_script = argument[3];
			
			if (unit.control_script == "player") {
				unit.sprite_index = spr_unit_red;
			} else {
				unit.sprite_index = spr_unit_blue;
			}
			
			return unit;
			break;
		
		case "die":
			var unit = argument[1];
			
			unit.alive = false;
			unit.sprite_index = spr_unit_dead;
			
			if (unit == global.game.player) {
				global.game.player = noone;
			}
			
			var idx = ds_list_find_index(global.game.enemies, unit);
			if (idx != -1) {
				ds_list_delete(global.game.enemies, idx);
			}
			
			layer_add_instance("Ground", unit);
			break;
		
		case "apply_controls":
			if (not global.game.controls_enabled) {
				return;
			}
			var unit = argument[1];
			
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
					unit.x, unit.y,
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
			
			//draw_arrow(unit.x, unit.y, unit.cursor_x, unit.cursor_y, 4);
			break;
		
		default:
			show_debug_message("ERROR - bad subscriptname: " + command);
	}
}