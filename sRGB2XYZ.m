function img_XYZ = sRGB2XYZ(img)
    [rows, columns, channels] = size(img);
    img_linear = zeros(size(img));
    for i = 1:rows
        for j = 1:columns
            for k = 1:channels
                if img(i,j,k) <= 0.04045
                    img_linear(i,j,k) = img(i,j,k)/12.92;
                else
                    img_linear(i,j,k) = ((img(i,j,k) + 0.055)/(1+0.055))^2.4;
                end
            end
        end
    end
    % Colorimetric data of Image:
    transformation_XYZ = [0.4124, 0.3576, 0.1805; 0.2126, 0.7152, 0.0722; 0.0193, 0.1192, 0.9505];
    img_linear = reshape(img_linear, [rows*columns, channels]);
    img_XYZ = transformation_XYZ*img_linear';
end