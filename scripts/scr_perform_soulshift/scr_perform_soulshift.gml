{
	var source = argument[0];
	var dest = argument[1];
	
	//dest.sprite_index = source.sprite_index;
	dest.control_script = source.control_script;
	dest.hp = dest.max_hp;
	
	scr_unit("die", source);
}