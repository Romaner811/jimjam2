/// @description Insert description here
// You can write your code in this editor

if (self.alive) {
	scr_unit_execute_control_script(self.control_script);
	scr_unit_apply_controls();
} else {
	//instance_destroy();
}
