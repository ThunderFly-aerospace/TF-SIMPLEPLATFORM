maximum_printable_size = 150;

layer_thickness = 0.3;
global_clearance = 0.5;


//Screw diameter and nut for M10 [mm]
M10_screw_diameter = 10.4;
M10_head_height = 10;
M10_head_diameter = 16+0.5;
M10_nut_height = 10.5;
M10_nut_diameter = 25.5;
M10_nut_pocket = 22.3;

//Screw diameter for M8 [mm]
M8_screw_diameter = 8.6;
M8_head_height = 8;
M8_head_diameter = 13.5;
M8_nut_height = 7.5;
M8_square_nut_thin_height = 4.5;
M8_nut_diameter = 14.4 + 0.5;
M8_nut_pocket = 13 + 0.5;
M8_washer_diameter = 16;
M8_washer_thickness = 1.5;


//Screw diameter and nut for M6 [mm]
M6_screw_diameter=6.5;
M6_head_diameter = 10+0.5;
M6_head_height = 6;
M6_nut_height = 4.9;
M6_nut_diameter = 11.8;
M6_nut_pocket = 10.4;
M6_square_nut_height = 3;
M6_square_nut_diameter = 10;
M6_washer_thickness = 1.6;

//Screw diameter and nut for M5 [mm]
M5_screw_diameter=5.5;
M5_head_height = 5;
M5_head_diameter = 13+0.5;
M5_nut_height = 4.5;
M5_nut_diameter = 9.4;
M5_nut_pocket = 8.4;

//Screw diameter and nut for M4 [mm]
M4_screw_diameter=4.5;
M4_screw_head_height = 4;
M4_nut_height = 3.2;
M4_nut_diameter = 8.4;
M4_nut_pocket = 7.5;

//Screw diameter and nut for M3 [mm]
M3_screw_diameter = 3.2;
M3_nut_height = 2.7;
M3_nut_diameter = 6.6;
M3_nut_pocket = 5.6;
M3_screw_head_height = 3;

//Screw diameter and nut for M2,5 [mm]
M2_5_screw_diameter = 2.7;
M2_5_nut_height = 2.3;
M2_5_nut_diameter = 6;
M2_5_nut_pocket = 5.5;

//ALU profile
ALU_profile_width = 30.5;
ALU_profile_holder_wall_thickness = 3;
ALU_profile_groove_width = 8;





// Platform parameters ////////////////////////////////////////////
// Main profile parameters
starting_platform_length = 1000; // Main platform profile length
starting_platform_angle = 10; // Angle of attack for platform

// Main cube profile lengths
profile_length_x = 600;
profile_length_y = 600;
profile_length_z = 260;


// Compressor dimensions
compressor_length_x = 410;
compressor_length_y = 140;
compressor_length_z = 310;

// Platform front support parameters
front_holder_width = 160;
front_holder_angle = 25;
front_holder_height = 60;
front_holder_offset = 15;
front_holder_height_offset = 110;

// Lock moving servo parameters
// static par.
servo_length = 40;
servo_width = 20;
servo_height = 40;
servo_axle_offset = 12.5;
servo_axle_height = 5;
servo_movement_angle = 60;
servo_movement_angle_offset = -35; // angle offset up
servo_force = 1.65; // [N/m] torque of servo

// dynamic par.
servo_arm_length = servo_width/2+ALU_profile_width/2+ALU_profile_holder_wall_thickness+4;
servo_travel_y = cos((servo_movement_angle-abs(servo_movement_angle_offset))/2)*servo_arm_length;
servo_arm_hole_length = (servo_arm_length/cos(servo_movement_angle/2))-servo_arm_length+M3_screw_diameter;
servo_joint_offset = sin(servo_movement_angle+servo_movement_angle_offset)*(servo_arm_length+servo_arm_hole_length)+servo_axle_offset;
servo_joint_offset_by_angle = -tan(servo_movement_angle_offset)*servo_arm_length;
servo_max_linear_force = servo_force/(servo_arm_length/1000); // max servo linear force [N]
servo_min_linear_force = cos(servo_movement_angle+abs(servo_movement_angle_offset))*servo_max_linear_force; // min servo linear force [N] in the most extreme position
servo_holding_linear_force = cos(servo_movement_angle+servo_movement_angle_offset)*servo_max_linear_force; // min servo linear force [N] in holding position

// Lock static parameters
lock_screws_dia = 3.2;
lock_depth = 20;
lock_axle_diameter = 15;
lock_grab_axle_dia = 13;
lock_arms_joint_offset = 30;
lock_arms_joint_angle = 90-.01;
lock_tooth_width = 2;

lock_tube_angle = 0;

// Lock dynamic parameters
lock_push_force = (servo_holding_linear_force/cos(lock_arms_joint_angle))/cos(lock_arms_joint_angle); // lock arm pushing force on linear servo joint
lock_push_arm_length = 45;
lock_arm_force_ratio = 1; // lock arm change holding force ratio (0.5 = arm will have half holding force)
lock_hold_arm_length = lock_push_arm_length/lock_arm_force_ratio;
lock_holding_force = lock_push_force*lock_arm_force_ratio;
lock_joint_arm_length = lock_push_arm_length;
