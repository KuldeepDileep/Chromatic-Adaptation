function XYZ_source = method1(img_XYZ)
    transformation_LMS = [0.4002, 0.7076, -0.0808; -0.2263, 1.1653, 0.0457; 0, 0, 0.9182];
    img_LMS = transformation_LMS*img_XYZ;
    A = zeros(length(img_LMS),1);
    for i = 1:length(img_LMS)
        L = img_LMS(1,i);
        M = img_LMS(2,i);
        S = img_LMS(3,i);
        A(i) = 2*L+M+(1/20)*S;
    end
    maxA_index = A==max(A, [], 'all');
    XYZ_source = img_XYZ(:,maxA_index);
end