function corrected_img = CAT02(img_XYZ, XYZ_source, XYZ_destination)
    [channels, rowsCols] = size(img_XYZ);
    MatA = [0.4002400, 0.7076000, -0.0808100; -0.2263000, 1.1653200, 0.0457000; 0.0000000, 0.0000000, 0.9182200];
    LMS_destination = MatA*XYZ_destination';
    LMS_source = MatA*XYZ_source;
    M_CAT02 = [0.7328, 0.4296, -0.1624; -0.7036, 1.6975, 0.0061; 0.0030, 0.0136, 0.9834];
    LMS = M_CAT02*img_XYZ;
    D = 1;
    LMS_c = zeros(channels, rowsCols);
    LMS_c(1,:) = (( (XYZ_source(2)*LMS_destination(1)) / (XYZ_destination(2)*LMS_source(1)) )*D + 1 - D)*LMS(1,:);
    LMS_c(2,:) = (( (XYZ_source(2)*LMS_destination(2)) / (XYZ_destination(2)*LMS_source(2)) )*D + 1 - D)*LMS(2,:);
    LMS_c(3,:) = (( (XYZ_source(2)*LMS_destination(3)) / (XYZ_destination(2)*LMS_source(3)) )*D + 1 - D)*LMS(3,:);
    M_inv = inv(M_CAT02);
    corrected_img = M_inv*LMS_c;
    corrected_img = corrected_img./100;
end