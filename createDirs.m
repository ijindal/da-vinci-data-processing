function [subj_dir, subj_leftimg_dir, subj_rightimg_dir] = createDirs(subject_no, pattern_no)
    % Create subject directories for right and left camera images
    if ~exist('data/', 'dir')
        mkdir data
    end
    
    subj_name = strcat('subject_',int2str(subject_no));
    pattern_name = strcat('pattern_',int2str(pattern_no));
    subj_dir = fullfile('./data/', subj_name);
    if ~exist(subj_dir, 'dir')
        fprintf('Directory do not exists: creating..\n')
        mkdir(subj_dir)
    else
        fprintf('Directory already exists: Do nothing \n')
    end
    pattern_dir = fullfile(subj_dir, pattern_name );
    subj_leftimg_dir = fullfile(pattern_dir, '/',strcat(subj_name, '_leftImg'));
    subj_rightimg_dir = fullfile(pattern_dir, '/',strcat(subj_name, '_rightImg'));
    mkdir(subj_leftimg_dir)
    mkdir(subj_rightimg_dir)

end

