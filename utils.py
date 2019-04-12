
import os

def filesNameRead(root, filename):
	'''
	itype: string--> root of the directory
	rtype: None
	Creates a file containing the path names of all the image files present 
	in the data directory.
	'''

	all_subfolders = []
	f = open(filename,"w")
	for subject_file in os.listdir(root):
		if subject_file.startswith('.') == False:
			# print("subject_file", subject_file)
			pattern_root = os.path.join(root, subject_file)
			for pattern_file in os.listdir(pattern_root):
				if pattern_file.startswith('.') == False:
					# print(pattern_file)
					img_root = os.path.join(pattern_root, pattern_file)
					for img_file in os.listdir(img_root):
						if not img_file.startswith('.'):
							# print(img_file)
							imgfile_root = os.path.join(img_root, img_file)
							for img in os.listdir(imgfile_root):
								if not img.startswith('.'):
									all_subfolders.append(os.path.join(imgfile_root, img))
									f.write(os.path.join(imgfile_root, img) + "\n")

	f.close()


def imgReader(filename):
	'''
	Read all the images specified in a file and resixe it and store it
	'''
	# importing matplotlib modules 
	import matplotlib.image as mpimg 
	import matplotlib.pyplot as plt 

	data = {}
	f = open(filename,"r")
	ind = 1
	for line in f:
		# Read Images 
		img_name = line.split('\n')
		print(img_name)
		img = mpimg.imread(img_name[0]) 
		data[ind] = img
		ind += 1

	return data

	# Output Images 
	# plt.imshow(img) 


if __name__ == "__main__":
	import matplotlib.image as mpimg 
	import matplotlib.pyplot as plt 
	root = "./data"

	filename = "image_files.txt"
	filesNameRead(root, filename)
	data = imgReader(filename)
	print(data[1].shape)
	plt.imshow(data[1])





