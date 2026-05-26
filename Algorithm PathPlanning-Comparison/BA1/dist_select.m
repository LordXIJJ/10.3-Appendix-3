% for l=1:K
%     Res(l)=Clustering(l).Sum_Distortion;
%     Res2(l)=Clustering(l).f_K;
% end
% [min_dist,min_dist_idx] = min(Res,[],'linear');
% [val,validx] = min(Res2,[],'linear');



for l=1:n-1
    Res(l)=Clustering(l).Sum_Distortion;
    Res2(l)=Clustering(l).f_K;
end
[min_dist,min_dist_idx] = min(Res,[],'linear');
[SelFunc,SelFuncidx] = min(Res2,[],'linear');