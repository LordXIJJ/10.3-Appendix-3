function y = New_Foraging2 (Position,nghk,upperBound,lowerBound,PSize)
   
    r = nghk * PSize;
    
    nVar = numel (Position);
    
    k = randi([1 nVar]);
    l = randi([1 nVar]);
    while k==l
        l = randi([1 nVar]);
    end
    
    y = Position;
%     for k=1:nVar
        if numel(PSize)>1
            y(k) = y(k)+ unifrnd(-r(k),r(k),1)*((-1)^randi(2));
            y(y>upperBound(k)) = upperBound(k);
            y(y<lowerBound(k)) = lowerBound(k);

            y(l) = y(l)+ unifrnd(-r(l),r(l),1)*((-1)^randi(2));
            y(y>upperBound(l)) = upperBound(l);
            y(y<lowerBound(l)) = lowerBound(l);
        else
            y(k) = y(k)+ unifrnd(-r,r,1)*((-1)^randi(2));
            y(y>upperBound) = upperBound;
            y(y<lowerBound) = lowerBound;  

            y(l) = y(l)+ unifrnd(-r,r,1)*((-1)^randi(2));
            y(y>upperBound) = upperBound;
            y(y<lowerBound) = lowerBound;
        end
%     end
    
    
end
