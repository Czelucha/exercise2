data = load('visiblehuman.mat');
head = data.head;
frozen = data.head_frozen;
fresh = data.head_fresh;
mri = data.head_mri;
imshow(head)
% cpselect(head)