function y = ForagingBBA (posisiPetak, ngh, batasAtas, batasBawah)
 
    nVar = numel (posisiPetak);
    
    k = randi ([1 nVar]);
       
    y = posisiPetak;
    ub_lb=(batasAtas-batasBawah);
    y(k) = y(k) + ngh * ((-1)^randi(2)) * ub_lb(k);

        if y(k)>batasAtas(k)
            y(k)=batasAtas(k);
        end
        if y(k)<batasBawah(k)
            y(k)=batasBawah(k);
        end

end
