R(1)=1;
for x = 2:n-1
    R(x) = Clustering(x).Sum_Distortion/Clustering(x-1).Sum_Distortion;
end
