
bag = rosbag('10_clutch_control_pattern4_sim.bag');
topic1 = bag.select('Topic','/camera2/usb_cam_right/image_raw/compressed');
data1 = readMessages(topic1);