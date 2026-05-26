function [ M ] = D_ExpandingUni (k,t,row,column)
    M=zeros(row,column);
    ngh = linspace(k,t,column+1);
    ngh(1) = [];

    for i=1:row
        for j=1:column
            
            M(i,j)= unifrnd(k,ngh(j),1);
            
        end
    end
end

% 
% function [ angka ] = D_Tri_real(k,t,b)
%     m=randi([1 10]);
%     a=(t-k)/10;
%     b=(b-t)/10;
%     
%     angka=unifrnd((t-m*a),(t+m*b),1);
%     
% end