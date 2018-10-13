/// @description Insert description here
// You can write your code in this editor


if (alarm[0] > 0) {
	var countdown = string(floor(alarm[0]/room_speed));

	draw_set_colour(c_white);
	draw_text_transformed(self.x + 1, self.y + 1, countdown, 10, 10, 0);
	draw_set_colour(c_lime);
	draw_text_transformed(self.x, self.y, countdown, 9, 9, 0);
}