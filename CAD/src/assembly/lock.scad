include <../../parameters.scad>

use <../888_1004.scad>
use <../888_1005.scad>
use <../888_1006.scad>
use <../888_1007.scad>
use <../888_1008.scad>
use <../888_1009.scad>
use <../lib/ALU_profile.scad>
use <../lib/servos.scad>


module lock() {
	solenoid_travel_ani = solenoid_travel * (sin(360*$t)+1)/2;
	solenoid_joint_distance_ani = solenoid_joint_distance + solenoid_travel_ani;

	joint_arm_move_y = (pow(solenoid_joint_distance_ani, 2) - pow(lock_joint_arm_length, 2) + pow(lock_push_arm_length, 2))/(2*solenoid_joint_distance_ani);
	joint_arm_move_x = sqrt(pow(lock_push_arm_length, 2) - pow(joint_arm_move_y, 2));
	joint_arm_angle = asin(joint_arm_move_x/lock_joint_arm_length);
	lock_arm_angle = acos(joint_arm_move_x/lock_push_arm_length);

	measure_offset = lock_hold_arm_length+lock_grab_axle_dia/2;
	lock_arm_move_x = sin(lock_arm_angle)*measure_offset;
	lock_arm_move_y = measure_offset-cos(lock_arm_angle)*measure_offset;

	servo_offset_value = (solenoid_joint_distance_ani+servo_joint_offset)-(solenoid_joint_distance+servo_joint_offset+2.5);
	servo_arm_angle = atan(servo_offset_value/servo_arm_length);

	translate([lock_depth/2-.5, 0, measure_offset-lock_arm_move_y+5])
	color([0.2, 0.5, 0.8])
	rotate([90, 0, -90])
	linear_extrude(4)
	text(text=str(floor(lock_arm_move_x*2*100)/100));
	
	translate([lock_depth/2-.5, 0, measure_offset-lock_arm_move_y])
	color([0.2, 0.5, 0.8])
	cube([1, lock_arm_move_x*2, 1], center=true);

	translate([.01, 0, -solenoid_joint_distance-solenoid_travel_ani-servo_joint_offset/2])
	rotate([0, -90, 0])
	color([0, 0.8, 0])
	888_1004();

	translate([0, joint_arm_move_x, -joint_arm_move_y])
	rotate([0, 90, 0])
	color([0.7, 0.7, 0])
	888_1007();

	translate([0, -joint_arm_move_x, -joint_arm_move_y])
	rotate([0, 90, 0])
	color([0.6, 0.6, 0])
	888_1007();

	translate([-5, -joint_arm_move_x, -joint_arm_move_y])
	rotate([0, 90, 0])
	color([0.6, 0.6, 0])
	888_1007();

	translate([-10, 0, -(solenoid_joint_distance+solenoid_travel_ani+servo_joint_offset)])
	rotate([0, 90, 0])
	color([0.6, 0.6, 0])
	888_1007();

	translate([-5, 0, -(solenoid_joint_distance+solenoid_travel_ani+servo_joint_offset)])
	rotate([0, 90, 0])
	color([0.6, 0.6, 0])
	888_1007();

	translate([-5, joint_arm_move_x, -joint_arm_move_y])
	rotate([0, 90, 0])
	rotate([0, 0, -joint_arm_angle])
	color([1, 0.8, 0])
	888_1006();

	translate([-10, -joint_arm_move_x, -joint_arm_move_y])
	rotate([0, 90, 0])
	rotate([0, 0, joint_arm_angle])
	color([1, 0.6, 0])
	888_1006();

	translate([lock_depth+5.5, .1, 0])
	rotate([0, -90, 0])
	rotate([0, 0, lock_arm_angle])
	color([1, 0.6, 0])
	888_1005();

	translate([5.5, -.1, 0])
	rotate([180, -90, 0])
	rotate([0, 0, lock_arm_angle])
	color([1, 0.8, 0])
	888_1005();
	
	translate([0, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, -10-lock_axle_diameter/2])
	rotate([90, 0, 90])
	color([1, 0.3, 0])
	888_1008();

	translate([0, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, -(solenoid_joint_distance+servo_joint_offset+2.5)])
	rotate([90, 0, 90])
	translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+12.1/2, -5.5, 5.5])
	rotate([0, 180, -90])
	color([0.2, 0.2, 0.5])
	D5313_servo();

	translate([-14, ALU_profile_width/2+ALU_profile_holder_wall_thickness+12.1/2, -(solenoid_joint_distance+servo_joint_offset+2.5)])
	rotate([-90, servo_arm_angle, -90])
	color([0.5, 0.5, 0.5])
	888_1009();

	translate([ALU_profile_width/2, 0, -100-17])
	#ALU_profile(height=100);
}

lock();
