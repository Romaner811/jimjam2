{
	var control_script = argument[0];
	
	if (not global.game.controls_enabled) {
		return false;
	}
	
	switch(control_script) {
		
		case noone:
		case "ai.noone":
			return true;
		
		case "player":
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
	
			return true;
		
		case "ai.generic.random":
			self.key_shift = random(1) > 0.5;
			self.key_attack = random(1) > 0.5;
	
			self.key_up = irandom_range(0, 1);
			self.key_left = irandom_range(0, 1);
			self.key_down = irandom_range(0, 1);
			self.key_right = irandom_range(0, 1);
	
			self.cursor_x += irandom_range(-10, 10);
			self.cursor_y += irandom_range(-10, 10);
			return true;
	
		case "ai.generic.smart":
			var WANDER = "wander";
			var CHASE = "chase";
			var FLEE = "flee";
			var FIGHT = "fight";
	
			// collect some info
			var enemies = ds_list_create();
			var enemy_amount = collision_circle_list(
				self.x, self.y, self.sight_range,
				Unit,
				false, // prec
				true, // notme
				enemies,
				true // ordered
			);
			var obstacle = collision_circle(
				self.x, self.y, self.attack_range,
				Obstacle,
				true, // prec
				true, // notme
			);
	
			var new_enemy = noone;
			for (var i = 0; i < enemy_amount; i++) {
				var current_enemy = ds_list_find_value(enemies, i);
				if (current_enemy.alive) {
					new_enemy = current_enemy;
					break;
				}
			}
	
			var wander_turn = random(1) <= self.wander_turn_chance;
	
			// Focus
			var move_direction = noone;
			if (self.focus != obstacle) {
				if (obstacle != noone) {
					self.focus = obstacle;
				} else {
					self.focus = self.enemy;
					wander_turn = true;
				}
			}
	
			if (self.enemy != new_enemy) {
				if (self.focus == self.enemy) {
					self.focus = new_enemy;
				}
				self.enemy = new_enemy;
			}
	
			// Make desicions
			if (self.focus == noone) {
				self.status = WANDER;
			} else {
				show_debug_message("focus: " + sprite_get_name(self.focus.sprite_index) + "@" + "(" + string(self.focus.x) + ", " + string(self.focus.y) + ")");
				self.cursor_x = self.focus.x;
				self.cursor_y = self.focus.y;
				move_direction = point_direction(self.x, self.y, self.cursor_x, self.cursor_y);
		
				if (self.focus == self.enemy) {
					show_debug_message("enemy: " + sprite_get_name(self.enemy.sprite_index));
					var enemy_distance = distance_to_object(self.focus);
					show_debug_message("(" + string(self.x) + ", " + string(self.y) + ")" + " I see you! " + "(" + string(self.focus.x) + ", " + string(self.focus.y) + ")" + "->" + string(enemy_distance));
			
					if (enemy_distance <= 1) {
						self.status = FLEE;
					} else if (enemy_distance <= self.attack_range) {
						self.status = FIGHT;
					} else {
						self.status = CHASE;
					}
			
				} else {
					self.status = FLEE;
				}
			}
	
			show_debug_message("status: " + self.status);
	
			// Carry out desicions
			if (self.status == FIGHT) {
				show_debug_message("hit!!");
				self.key_attack = (self.key_attack + 1) % 2;
				show_debug_message("attacking: " + string(self.key_attack));
			} else {
				self.key_attack = 0;
			}
			if (self.status == CHASE or self.status == FIGHT) {
				show_debug_message("Come here! I tear you apart!!");
			}
			if (self.status == FLEE) {
				show_debug_message("get away!");
				move_direction = (move_direction + 180) % 360;
			}
			if (self.status == WANDER) {
				show_debug_message("don't see any thing..");
				wander_turn = wander_turn or point_in_rectangle(
					self.cursor_x, self.cursor_y,
					self.bbox_left, self.bbox_top,
					self.bbox_right, self.bbox_bottom,
				);
				if (wander_turn) {
					self.cursor_x = irandom_range(0, room_width);
					self.cursor_y = irandom_range(0, room_height);
					show_debug_message("wander turn");
				}
				move_direction = point_direction(self.x, self.y, self.cursor_x, self.cursor_y);
			}
	
			show_debug_message(
				"(" + string(self.x) + ", " + string(self.y) + ")" + " " +
				"step towards: " + string(move_direction) + " " +
				"(" + string(self.cursor_x) + ", " + string(self.cursor_y) + ")"
			);
			scr_aiutil_kb_goto(self, move_direction);
			show_debug_message("===========");
			
			return true;
		
		default:
			show_debug_message("unknown control script: " + control_script);
			return false;
	}
}