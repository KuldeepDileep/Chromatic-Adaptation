function XYZ_source = method2(img_XYZ_method2, file_name)
    if strcmp(file_name, 'Lab2_6-2.jpg')
        XYZ_source = img_XYZ_method2(15,340,:);
    elseif strcmp(file_name, 'Lab2_6-3.jpg')
        XYZ_source = img_XYZ_method2(70,50,:);
    elseif strcmp(file_name, 'Lab2_6-4.jpg')
        XYZ_source = img_XYZ_method2(340,70,:);
    elseif strcmp(file_name, 'Lab2_6-1-a.jpg')
        XYZ_source = img_XYZ_method2(88,388,:);
    elseif strcmp(file_name, 'Lab2_6-1-b.jpg')
        XYZ_source = img_XYZ_method2(93,263,:);
    elseif strcmp(file_name, 'Lab2_6-1-c.jpg')
        XYZ_source = img_XYZ_method2(96,210,:);
    elseif strcmp(file_name, 'Lab2_6-5-a.jpg')
        XYZ_source = img_XYZ_method2(85,160,:);
    elseif strcmp(file_name, 'Lab2_6-5-b.jpg')
        XYZ_source = img_XYZ_method2(80,160,:);
    elseif strcmp(file_name, 'Lab2_6-5-c.jpg')
        XYZ_source = img_XYZ_method2(80,160,:);
    end
    XYZ_source = reshape(XYZ_source,1,[]);
    XYZ_source = XYZ_source';
end