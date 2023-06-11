function corrected_RGB = XYZ2sRGB(correctedImg_XYZ)
    [channels, rowsCols] = size(correctedImg_XYZ);
    corrected_RGB_linear = [3.2410, -1.5374, -0.4986; -0.9692, 1.8760, 0.0416; 0.0556, -0.2040, 1.0570]*correctedImg_XYZ;
    corrected_RGB = zeros(channels, rowsCols);
    for i = 1:rowsCols
        for j = 1:channels
            if corrected_RGB_linear(j, i) <= 0.0031308
                corrected_RGB(j,i) = 12.92*corrected_RGB_linear(j, i);
            else
                corrected_RGB(j,i) = (1+0.055)*(corrected_RGB_linear(j, i)^(1/2.4)) - 0.055;
            end
        end
    end
    corrected_RGB = corrected_RGB';
end