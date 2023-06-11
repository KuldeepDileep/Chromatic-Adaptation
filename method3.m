function XYZ_source = method3(RGB_img)
    R = mean(RGB_img(:,:,1), 'all');
    G = mean(RGB_img(:,:,2), 'all');
    B = mean(RGB_img(:,:,3), 'all');
    RGB_av = zeros(1,1,3);
    RGB_av(1,1,1) = R;
    RGB_av(1,1,2) = G;
    RGB_av(1,1,3) = B;
    XYZ = sRGB2XYZ(RGB_av);
    % chromaticity coordinates:
    x_av = XYZ(1)/(XYZ(1)+XYZ(2)+XYZ(3));
    y_av = XYZ(2)/(XYZ(1)+XYZ(2)+XYZ(3));
    Y_perf = 100;
    X = (x_av/y_av)*Y_perf;
    Y = Y_perf;
    Z = ((1-x_av-y_av)/y_av)*Y;
    XYZ_source = zeros(3,1);
    XYZ_source(1,1) = X;
    XYZ_source(2,1) = Y;
    XYZ_source(3,1) = Z;
end