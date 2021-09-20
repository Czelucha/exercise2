function [f, sig] = FiducialLocalizationError(x)
%The following function takes and a 3D array containing 2D coordinates of
%fiducial points and calculates the fiduacial localization error matrix as
%well as the fiducial localization variance
    N = size(x, 1);
    J = size(x, 3);
    xMean = mean(x, 3);
    f = [0 0; 0 0];
    for i = 1:size(x, 1)
        for j = 1:size(x, 3)
            f = f + (x(i, :, j) - xMean(i, :))' * ...
                (x(i, :, j) - xMean(i, :));
        end
    end
    f = f / (N * J);
    sig = mean(diag(f));
    
end