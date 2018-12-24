global.game = self;


self.seed = date_get_second_of_year(date_current_datetime());

var player_spawn_x = room_width / 2.0;
var player_spawn_y = room_height / 2.0;

var enemy_ais = ds_list_create();
ds_list_add(enemy_ais,
	"ai.noone",
	"ai.noone",
	"ai.noone",
	"ai.noone",
	
	"ai.generic.random",
	"ai.generic.random",
	"ai.generic.random",
	"ai.generic.random",
	
	"ai.generic.smart",
	"ai.generic.smart",
	"ai.generic.smart",
	"ai.generic.smart",
);


/* Init logic: */
self.controls_enabled = false;
self.alarm[0] = room_speed * 5;
self.enemies = ds_list_create();

random_set_seed(self.seed);


/* putting units */

self.player = scr_unit("init",
	instance_create_layer(
		player_spawn_x, player_spawn_y,
		self.layer,
		Unit
	),
	"default",
	"player"
);


for (var i = 0; i < ds_list_size(enemy_ais); i++) {
	var current_enemy_ai = ds_list_find_value(enemy_ais, i);
	var current_enemy_x, current_enemy_y;
	do {
		current_enemy_x = irandom_range(Unit.sprite_width, room_width - Unit.sprite_width);
		current_enemy_y = irandom_range(Unit.sprite_height, room_height - Unit.sprite_height);
	} until (collision_circle(current_enemy_x, current_enemy_y, Unit.sprite_width * 4, all, false, false) == noone)
	
	var new_enemy = scr_unit("init",
		instance_create_layer(
			current_enemy_x, current_enemy_y,
			"Units", Unit
		),
		"default",
		current_enemy_ai
	);
	ds_list_add(self.enemies, new_enemy);
	show_debug_message(new_enemy.control_script);
}
