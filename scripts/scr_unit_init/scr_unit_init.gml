{
	var unit = argument[0];
	
	unit.class = argument[1];
	unit.control_script = argument[2];
	
	if (unit.control_script == "player") {
		unit.sprite_index = spr_unit_red;
	} else {
		unit.sprite_index = spr_unit_blue;
	}
	
	return unit;
}