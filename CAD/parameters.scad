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

// kulove lozisko

bearing_efsm_08_h = 33+1;
bearing_efsm_08_m = 22;
bearing_efsm_08_db = 18;
bearing_efsm_08_ag = 10.5;
bearing_efsm_08_n = M4_screw_diameter;
bearing_efsm_08_a1 = 5.5;
bearing_efsm_08_d = 8.25;
bearing_efsm_08_B = 8; // ball height

bearing_efsm_10_h = 38+1;
bearing_efsm_10_m = 26;
bearing_efsm_10_db = 21.9;
bearing_efsm_10_ag = 12+0.2;
bearing_efsm_10_n = M5_screw_diameter;
bearing_efsm_10_a1 = 6.5;
bearing_efsm_10_d = 10.25;


bearing_efsm_12_width = 40+1;
bearing_efsm_12_h = bearing_efsm_12_width;
bearing_efsm_12_boltd = 28/2; // polovina vzdalenosti mezi srouby
bearing_efsm_12_m = bearing_efsm_12_boltd*2;
bearing_efsm_12_db = 25;
bearing_efsm_12_ag = 13;
bearing_efsm_12_a1 = 7;
bearing_efsm_12_n = M5_screw_diameter;
bearing_efsm_12_d = 12.15;
bearing_efsm_12_B = 10; // ball height
bearing_efsm_space = 1;

bearing_efsm_17_width = 54+1;
bearing_efsm_17_h = bearing_efsm_17_width;
bearing_efsm_17_boltd = 38/2; // polovina vzdalenosti mezi srouby
bearing_efsm_17_m = bearing_efsm_17_boltd*2;
bearing_efsm_17_db = 35;
bearing_efsm_17_ag = 18;
bearing_efsm_17_n = M6_screw_diameter;
bearing_efsm_17_a1 = 10;
bearing_efsm_17_B = 17; // ball height

//limcove lozisko
bearing_EFOM_10_L=26; //celkova sirka zakladny
bearing_EFOM_10_d1=10.3;//diametr otvoru real=10 mm
bearing_EFOM_10_dB=22;//diametr vystupku pro ulozeni lozika
bearing_EFOM_10_H=52;//celková delka zakladny
bearing_EFOM_10_J=36;// hole pitch
bearing_EFOM_10_A1=6.5;//vyska pouzdra
bearing_EFOM_10_Ag=12;//celkova vyska
bearing_EFOM_10_N1=5;//sirka otvoru pro sroub
bearing_EFOM_10_N2=8;//delka otvoru pro sroub
bearing_EFOM_10_m=36;//roztec der pro sroub
bearing_EFOM_10_h=9;//vyska lozika


608_bearing_outer_diameter = 22.3;
608_bearing_inner_diameter = 16;
608_bearing_thickness = 7.1;


// 20 KG servo parameters

servo_20kg_axis_offset = 9.375; // jak je osa mimo stredu
servo_20kg_body_x = 42;
servo_20kg_body_y = 21;
servo_20kg_body_z = 40;
servo_20kg_thread_x = 49/2;
servo_20kg_thread_y = 10/2;
servo_20kg_body_below = 10; // jak hluboko je tělo serva pod drzaky na srouby
servo_20kg_below = 25.8; // jak hluboko je páka serva pod drzaky na srouby

servo_20kg_bolt_d = 2.5+0.3;
servo_20kg_nut_d = 5+0.3;


//strain gauge
strain_gauge_width = 12.7;
strain_gauge_length = 75.1;
strain_gauge_screw_distance = 10;

//ALU profile
ALU_profile_width = 30.5;
ALU_profile_holder_wall_thickness = 3;
ALU_profile_groove_width = 8;

//pillow block bearing
//https://www.igus.eu/product/372
//Part no. KSTM-08
KSTM08_screws_distance = 33;         //m
KSTM08_screws_holes_diameter = 4.5;  //d2
KSTM08_flange_thickness = 6;         //h3
KSTM08_case_width = 9;               //C1
KSTM08_case_length = 47;             //a
KSTM08_ball_width = 12;              //B
KSTM08_ball_hole_diameter = 7.85;    //d1


//ložiska pro malý rotor
bearing_outer_diameter = 10.2;    // Rozměr B1 v nákresu s přídavkem na toleranci otvoru
bearing_thickness = 4;        // Rozměr B2 v nákresu
//bearing_shaft_length = 19.5;    // Rozměr B3 v nákresu, Originalni hodnota 19.5
bearing_shaft_length = 20;    // Rozměr B3 v nákresu


// Platform parameters ////////////////////////////////////////////


// Main cube profile lengths
profile_length_x = 600;
profile_length_y = 600;
profile_length_z = 260;


compresor_length_x = 410;
compresor_length_y = 140;
compresor_length_z = 310;


front_holder_width = 160;
front_holder_angle = 25;
front_holder_height = 60;
front_holder_offset = 15;
front_holder_height_offset = 75;

starting_platform_length = 800;
starting_platform_angle = 10;

// lock moving servo parameters
// static par.
servo_length = 40;
servo_width = 20;
servo_height = 40;
servo_axle_offset = 12.5;
servo_axle_height = 5;
servo_movement_angle = 70;
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

// lock static parameters
lock_screws_dia = 3.08;
lock_depth = 20;
lock_axle_diameter = 15;
lock_grab_axle_dia = 13;
lock_arms_joint_offset = 30;
lock_arms_joint_angle = 89;
lock_tooth_width = 2;

lock_tube_angle = 5;

// lock dynamic parameters
lock_push_force = (servo_holding_linear_force/cos(lock_arms_joint_angle))/cos(lock_arms_joint_angle); // lock arm pushing force on linear servo joint
lock_push_arm_length = 45;
lock_arm_force_ratio = 1; // lock arm change holding force ratio (0.5 = arm will have half holding force)
lock_hold_arm_length = lock_push_arm_length/lock_arm_force_ratio;
lock_holding_force = lock_push_force*lock_arm_force_ratio;
lock_joint_arm_length = lock_push_arm_length;
