% Author: Parinaz
% Reading Ros files is quite easy withmatlab if you are working on Mac...
% This file extract the image stream from the rosbag file.

%% 
clc;close all;clear all;

%% Read rosebag files and select  image stream 
bag = rosbag('10_clutch_control_pattern4_sim.bag');
% bag_all = readMessages(bag);
img_right = bag.select('Topic','/camera2/usb_cam_right/image_raw/compressed');
img_left = bag.select('Topic','/camera1/usb_cam_left/image_raw/compressed');
data_right = readMessages(img_right);
data_left = readMessages(img_left);
%%
for i  = 1:1:624
    out(i) = data_left{2500,1}.Data(i) - data_left{1500,1}.Data(i);
end
%%

% img = reshape(data_left{2500,1}.Data(1:36300),  [330, 110]);
% imshow(img)

=======
topic1 = bag.select('Topic','/camera2/usb_cam_right/image_raw/compressed');
data1 = readMessages(topic1);
img_data1 = readImage(data1{1,1});
imshow(img_data1)


