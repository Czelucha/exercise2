function f = FiducialRegistrationError(tem, ref)
%This function takes a set of coordinates of a 
% template and reference image and estimates the fiducial registration
% error given optimal parameters of a similirity transform from the
% template to the reference
    %Obtain the parameters for a similarity transform
    [s, R, t] = SimilarityTransform(tem, ref);
    temTransform = s * R * tem' + t;
    f = sum((temTransform - ref').^2, "all") / (2 * size(tem, 1));
end