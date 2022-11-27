function z = returnZ(x,y,distance,t,v,lambda_)
z = zeros(size(x));
[sizeRealX, sizeRealY] = size(z);
for i = 1:sizeRealX
    for j = 1:sizeRealY
        distOfWave = v*t;
        if distance(i,j) > distOfWave
            z(i,j) = 0;
        else
            z(i,j) = sin(2*pi*(distance(i,j)-distOfWave)/lambda_);
            %z(i,j) = z(i,j)/(1+distance(i,j));
        end
    end
end
