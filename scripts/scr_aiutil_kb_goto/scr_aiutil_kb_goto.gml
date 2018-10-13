{
	var unit = argument[0];
	var face_direction = argument[1];
	
	// the one who wrote this is an idiot. (it was me)
	//(90+45=135 ) \/ (45=45)
	//(180+45=225) /\ (270+45=315 OR -45...)
	/*
	unit.key_up = 0;
	if (face_direction >= 45 and face_direction <= 135) {
		unit.key_up = 1;
	}
	unit.key_down = 0;
	if (face_direction >= 225 and face_direction <= 315) {
		unit.key_down = 1;
	}
	unit.key_left = 0;
	if (face_direction >= 135 and face_direction <= 225) {
		unit.key_left = 1;
	}
	unit.key_right = 0;
	if (
		(face_direction >= -45 and face_direction <= 45) or
		(face_direction >= 315 and face_direction <= 405)
	) {
		unit.key_right = 1;
	}
	*/
	
	// so i wrote this instead:
	// but this is also incomplete..
	/*
	unit.key_up = 0;
	if (face_direction >= 0 and face_direction <= 180) {
		unit.key_up = 1;
	}
	unit.key_down = 0;
	if (face_direction >= 180 and face_direction <= 360) {
		unit.key_down = 1;
	}
	unit.key_left = 0;
	if (face_direction >= 90 and face_direction <= 270) {
		unit.key_left = 1;
	}
	unit.key_right = 0;
	if (
		(face_direction >= -90 and face_direction <= 90) or
		(face_direction >= 270 and face_direction <= 450)
	) {
		unit.key_right = 1;
	}
	*/
	
	// so i did this: (the hybrid)
	unit.key_up = 0;
	if (face_direction >= 22.5 and face_direction <= 157.5) {
		unit.key_up = 1;
	}
	unit.key_down = 0;
	if (face_direction >= 202.5 and face_direction <= 337.5) {
		unit.key_down = 1;
	}
	unit.key_left = 0;
	if (face_direction >= 112.5 and face_direction <= 247.5) {
		unit.key_left = 1;
	}
	unit.key_right = 0;
	if (
		(face_direction >= -67.5 and face_direction <= 112.5) or
		(face_direction >= 292.5 and face_direction <= 427.5)
	) {
		unit.key_right = 1;
	}
}