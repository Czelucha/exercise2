function ShowLandmarks(Im, Points)
%This function takes an image, it's annotated landmarks and visualizes the
%image together with the annotated and the mean landmarks
    Markers = ["ro", "y+", "mx"];
    Leg = strcat("Landmarks ", string(num2cell(1:size(Points, 3))));
    Leg(end + 1) = "Mean Landmarks";
    imshow(Im);
    hold on;
    for i = 1:size(Points, 3)
        plot(Points(:, 1, i), Points(:, 2, i), Markers(i), "MarkerSize", 15);
    end
    PointsMean = mean(Points, 3);
    plot(PointsMean(:, 1), PointsMean(:, 2), "g.", "MarkerSize", 20);
    legend(Leg, "Location", "bestoutside");
    hold off;
end