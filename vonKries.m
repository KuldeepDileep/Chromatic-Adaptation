function corrected_img = vonKries(img_XYZ, XYZ_source, XYZ_destination)
MatA = [0.4002400, 0.7076000, -0.0808100; -0.2263000, 1.1653200, 0.0457000; 0.0000000, 0.0000000, 0.9182200];
MatA_inv = [1.8599364, -1.1293816, 0.2198974; 0.3611914, 0.6388125, -0.0000064; 0.0000000, 0.0000000, 1.0890636];
LMS_destination = MatA*XYZ_destination';
LMS_source = MatA*XYZ_source;
Mat = MatA_inv*[LMS_destination(1)/LMS_source(1), 0, 0; 0, LMS_destination(2)/LMS_source(2), 0; 0, 0, LMS_destination(3)/LMS_source(3)]*MatA;
correctedImg_XYZ = Mat*img_XYZ;
corrected_img = correctedImg_XYZ./100;
end