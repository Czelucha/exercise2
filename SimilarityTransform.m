function [s, R, t] = SimilarityTransform(tem, ref)
%This function takes landmark coordinates of a reference and template image
%and performs a similarity transformation (scaling, rotation and
%translation) in order to optimally transform the landmarks of the template
%image to the reference image
    %Define the matrix H
    H = zeros([2, 2]);
    for i = 1:size(tem, 1)
        H = H + tem(i, :)' * ref(i, :);
    end
    %Perform singular value decomposition of matrix H
    [U, ~, V] = svd(H);
    R = V * diag([1 det(V * U)]) * U';
    s = sum(diag(tem * R * ref')) / sum(tem.^2, "all");
    xM = mean(tem, 1);
    yM = mean(ref, 1);
    t = yM' - s * R * xM';
end