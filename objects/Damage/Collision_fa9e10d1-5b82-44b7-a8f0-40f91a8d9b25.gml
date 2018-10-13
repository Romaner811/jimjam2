/// @description Insert description here
// You can write your code in this editor


if (
	other.alive and
	other != self.owner and
	not ds_list_find_index(self.hits, other.id)
) {
	ds_list_add(self.hits, other.id);
	
	other.hp = max(0, other.hp - self.owner.damage);
	
	if (other.hp == 0) {
		if (self.owner.alive) {
			scr_perform_soulshift(self.owner, other);
		}
	}
}
