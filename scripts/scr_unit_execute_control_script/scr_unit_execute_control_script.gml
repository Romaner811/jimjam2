{
	var control_script = argument[0];
	
	switch(control_script) {
		
		case noone:
		case "ai.noone":
			return true;
	
		case "player":
			scr_unit_control_player();
			return true;
	
		case "ai.generic.random":
			scr_unit_control_generic_ai_random();
			return true;
	
		case "ai.generic.smart":
			scr_unit_control_generic_ai_smart();
			return true;
	
		default:
			show_debug_message("unknown control script: " + control_script);
			return false;
	}
}