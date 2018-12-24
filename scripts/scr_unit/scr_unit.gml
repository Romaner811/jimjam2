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
		default:
			show_debug_message("ERROR - bad subscriptname: " + command);
	}
}