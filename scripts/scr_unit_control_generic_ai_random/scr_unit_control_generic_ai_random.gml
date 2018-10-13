{
	self.key_shift = random(1) > 0.5;
	self.key_attack = random(1) > 0.5;
	
	self.key_up = irandom_range(0, 1);
	self.key_left = irandom_range(0, 1);
	self.key_down = irandom_range(0, 1);
	self.key_right = irandom_range(0, 1);
	
	self.cursor_x += irandom_range(-10, 10);
	self.cursor_y += irandom_range(-10, 10);
}