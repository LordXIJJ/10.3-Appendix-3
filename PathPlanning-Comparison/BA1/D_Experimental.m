function [ M ] = D_Experimental (k,t,b,row,column)
    M=zeros(row,column);
    for i=1:row
        for j=1:column

            M(i,j)=D_Tri_real(k,t,b);
            
        end
    end
end

function [ val ] = D_Tri_real(k,t,b)
    m=rand();
    F = (t-k)/(b-k);
    if m<=F
        val= k + sqrt(m*(b-k)*(t-k));
    else
        val= b - sqrt((1-m)*(b-k)*(b-t));
    end
        
end