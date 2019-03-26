
%{
	Author: Parinaz
	Reading Ros files is quite easy withmatlab if you are working on Mac.
	This file extract the image stream from the rosbag file. 
}%
%% 
clc;close all;clear all;

%% Read rosebag files and select  image stream 
bag = rosbag('10_clutch_control_pattern4_sim.bag');
topic1 = bag.select('Topic','/camera2/usb_cam_right/image_raw/compressed');
data1 = readMessages(topic1);