% Author: Parinaz & Ishan
% Reading Ros files is quite easy withmatlab if you are working on Mac...
% This file extract the image stream from the rosbag file.
%
clc;close all;clear all;
%% Creat directories corresponding toeach subject for storing left and 
% right camera images.
rosbab_filename = '4_joystick_pattern3_sim.bag';
subject_no = 10;
pattern_no = 3;
[subj_dir, subj_leftimg_dir, subj_rightimg_dir] = createDirs(subject_no, pattern_no);
%% Read rosebag files and select  image stream 
bag = rosbag(rosbab_filename);

img_right = bag.select('Topic','/camera2/usb_cam_right/image_raw/compressed');
data_right = readMessages(img_right);
% Wrie images in respective folders
for i = 1:1:length(data_right)
    img = imresize(readImage(data_right{i,1}), [32, 32, 3]);
    baseFileName = sprintf('Image_#%d.png', i);
    fullFileName = fullfile(subj_rightimg_dir, baseFileName);
    imwrite(img, fullFileName);
end

%% 
img_left = bag.select('Topic','/camera1/usb_cam_left/image_raw/compressed');
data_left = readMessages(img_left);

% Wrie images in respective folders
for i = 1:1:length(data_left)
    img = imresize(readImage(data_left{i,1}), [32, 32, 3]);
    baseFileName = sprintf('Image_#%d.png', i);
    fullFileName = fullfile(subj_leftimg_dir, baseFileName);
    imwrite(img, fullFileName);
end