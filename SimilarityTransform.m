function [s, R, t] = SimilarityTransform(tem, ref)
%This function takes landmark coordinates of a reference and template image
%and performs a similarity transformation (scaling, rotation and
%translation) in order to optimally transform the landmarks of the template
%image to the reference image
    %Center the landmark sets
    temCenter = tem - mean(tem, 1);
    refCenter = ref - mean(ref, 1);
    %Define the matrix H
    H = zeros([2, 2]);
    for i = 1:size(tem, 1)
        H = H + temCenter(i, :)' * refCenter(i, :);
    end
    %Perform singular value decomposition of matrix
    [U, ~, V] = svd(H);
    R = V * diag([1 det(V * U)]) * U';
    s = sum(diag(temCenter * R * refCenter')) / sum(temCenter.^2, "all");
    xM = mean(tem, 1);
    yM = mean(ref, 1);
    t = yM' - s * R * xM';
end