/// @description Insert description here
// You can write your code in this editor

scr_unit("clean_controls", self);

self.control_script = "player";
self.class = "default";

self.max_hp = 100;
self.damage = 10;
self.walking_speed = 3;


self.hp = self.max_hp;
self.alive = true;



self.wander_turn_chance = 0.01;
self.status = noone;
self.sight_range = self.sprite_width + (self.walking_speed * 100);
self.attack_range = self.sprite_width + (self.walking_speed * 1);
self.focus = noone;
self.enemy = noone;