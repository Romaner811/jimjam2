/// @description Insert description here
// You can write your code in this editor

var overlap_left = max(0, self.bbox_left - other.bbox_right);
var overlap_right = max(0, other.bbox_left - self.bbox_right);
var overlap_top = max(0, self.bbox_top - other.bbox_bottom);
var overlap_bottom = max(0, other.bbox_top - self.bbox_bottom);

//if (not (overlap_right > 0 and overlap_left > 0)) {
other.x += overlap_right;
other.x -= overlap_left;
//}


//if (not (overlap_bottom > 0 and overlap_top > 0)) {
other.y += overlap_bottom;
other.y -= overlap_top;
//}
