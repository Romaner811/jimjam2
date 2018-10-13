{
	var unit = argument[0];
	
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
}