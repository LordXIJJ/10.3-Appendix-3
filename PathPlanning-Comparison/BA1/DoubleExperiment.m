[Result_SBA1.it , Result_SBA1.OptCost, Result_SBA1.NFE] = Function_BBA1('F15', 100);
%% Martin
%100
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 100);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);


[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 100);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

end
save BBA1_Martin_100 Result_BBA1
save SBA1_Martin_100 Result_SBA1

clear
clc

%90
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 90);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 90);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
end
save BBA1_Martin_90 Result_BBA1
save BBA1_OA_Martin_90 Result_BBA1_OA
save SBA1_Martin_90 Result_SBA1
save SBA1_OA_Martin_90 Result_SBA1_OA

clear
clc

%80
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 80);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Martin', 80);
Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 80);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

[Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Martin', 80);
Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
end
save BBA1_Martin_80 Result_BBA1
save BBA1_OA_Martin_80 Result_BBA1_OA
save SBA1_Martin_80 Result_SBA1
save SBA1_OA_Martin_80 Result_SBA1_OA

clear
clc


%70
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 70);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Martin', 70);
Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 70);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

[Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Martin', 70);
Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
end
save BBA1_Martin_70 Result_BBA1
save BBA1_OA_Martin_70 Result_BBA1_OA
save SBA1_Martin_70 Result_SBA1
save SBA1_OA_Martin_70 Result_SBA1_OA

clear
clc

%60
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 60);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Martin', 60);
Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 60);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

[Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Martin', 60);
Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
end
save BBA1_Martin_60 Result_BBA1
save BBA1_OA_Martin_60 Result_BBA1_OA
save SBA1_Martin_60 Result_SBA1
save SBA1_OA_Martin_60 Result_SBA1_OA

clear
clc

%50
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 50);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Martin', 50);
Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 50);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

[Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Martin', 50);
Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
end
save BBA1_Martin_50 Result_BBA1
save BBA1_OA_Martin_50 Result_BBA1_OA
save SBA1_Martin_50 Result_SBA1
save SBA1_OA_Martin_50 Result_SBA1_OA

clear
clc

%50
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 40);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Martin', 40);
Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 40);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

[Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Martin', 40);
Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
end
save BBA1_Martin_40 Result_BBA1
save BBA1_OA_Martin_40 Result_BBA1_OA
save SBA1_Martin_40 Result_SBA1
save SBA1_OA_Martin_40 Result_SBA1_OA

clear
clc

%50
for tour=1:50
[Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Martin', 30);
Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);

[Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Martin', 30);
Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);

[Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Martin', 30);
Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);

[Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Martin', 30);
Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
end
save BBA1_Martin_30 Result_BBA1
save BBA1_OA_Martin_30 Result_BBA1_OA
save SBA1_Martin_30 Result_SBA1
save SBA1_OA_Martin_30 Result_SBA1_OA
% 
% clear
% clc
% 
% %%
% %%
% %%
% %% Schwefel_2
% 
% %100
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 100);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 100);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 100);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 100);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_100 Result_BBA1
% save BBA1_OA_Schwefel_2_100 Result_BBA1_OA
% save SBA1_Schwefel_2_100 Result_SBA1
% save SBA1_OA_Schwefel_2_100 Result_SBA1_OA
% 
% clear
% clc
% 
% %90
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 90);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 90);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 90);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 90);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_90 Result_BBA1
% save BBA1_OA_Schwefel_2_90 Result_BBA1_OA
% save SBA1_Schwefel_2_90 Result_SBA1
% save SBA1_OA_Schwefel_2_90 Result_SBA1_OA
% 
% clear
% clc
% 
% %80
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 80);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 80);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 80);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 80);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_80 Result_BBA1
% save BBA1_OA_Schwefel_2_80 Result_BBA1_OA
% save SBA1_Schwefel_2_80 Result_SBA1
% save SBA1_OA_Schwefel_2_80 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% %70
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 70);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 70);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 70);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 70);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_70 Result_BBA1
% save BBA1_OA_Schwefel_2_70 Result_BBA1_OA
% save SBA1_Schwefel_2_70 Result_SBA1
% save SBA1_OA_Schwefel_2_70 Result_SBA1_OA
% 
% clear
% clc
% 
% %60
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 60);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 60);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 60);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 60);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_60 Result_BBA1
% save BBA1_OA_Schwefel_2_60 Result_BBA1_OA
% save SBA1_Schwefel_2_60 Result_SBA1
% save SBA1_OA_Schwefel_2_60 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 50);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 50);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 50);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 50);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_50 Result_BBA1
% save BBA1_OA_Schwefel_2_50 Result_BBA1_OA
% save SBA1_Schwefel_2_50 Result_SBA1
% save SBA1_OA_Schwefel_2_50 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 40);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 40);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 40);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 40);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_40 Result_BBA1
% save BBA1_OA_Schwefel_2_40 Result_BBA1_OA
% save SBA1_Schwefel_2_40 Result_SBA1
% save SBA1_OA_Schwefel_2_40 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Schwefel_2', 30);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Schwefel_2', 30);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Schwefel_2', 30);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Schwefel_2', 30);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Schwefel_2_30 Result_BBA1
% save BBA1_OA_Schwefel_2_30 Result_BBA1_OA
% save SBA1_Schwefel_2_30 Result_SBA1
% save SBA1_OA_BranSchwefel_2n_30 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% 
% %%
% %%
% %%
% %% 6humpCamelBack
% %100
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 100);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 100);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 100);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 100);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_100 Result_BBA1
% save BBA1_OA_6humpCamelBack_100 Result_BBA1_OA
% save SBA1_6humpCamelBack_100 Result_SBA1
% save SBA1_OA_6humpCamelBack_100 Result_SBA1_OA
% 
% clear
% clc
% 
% %90
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 90);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 90);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 90);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 90);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_90 Result_BBA1
% save BBA1_OA_6humpCamelBack_90 Result_BBA1_OA
% save SBA1_6humpCamelBack_90 Result_SBA1
% save SBA1_OA_6humpCamelBack_90 Result_SBA1_OA
% 
% clear
% clc
% 
% %80
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 80);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 80);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 80);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 80);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_80 Result_BBA1
% save BBA1_OA_6humpCamelBack_80 Result_BBA1_OA
% save SBA1_6humpCamelBack_80 Result_SBA1
% save SBA1_OA_6humpCamelBack_80 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% %70
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 70);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 70);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 70);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 70);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_70 Result_BBA1
% save BBA1_OA_6humpCamelBack_70 Result_BBA1_OA
% save SBA1_6humpCamelBack_70 Result_SBA1
% save SBA1_OA_6humpCamelBack_70 Result_SBA1_OA
% 
% clear
% clc
% 
% %60
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 60);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 60);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 60);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 60);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_60 Result_BBA1
% save BBA1_OA_6humpCamelBack_60 Result_BBA1_OA
% save SBA1_6humpCamelBack_60 Result_SBA1
% save SBA1_OA_6humpCamelBack_60 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 50);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 50);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 50);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 50);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_50 Result_BBA1
% save BBA1_OA_6humpCamelBack_50 Result_BBA1_OA
% save SBA1_6humpCamelBack_50 Result_SBA1
% save SBA1_OA_6humpCamelBack_50 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 40);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 40);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 40);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 40);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_40 Result_BBA1
% save BBA1_OA_6humpCamelBack_40 Result_BBA1_OA
% save SBA1_6humpCamelBack_40 Result_SBA1
% save SBA1_OA_6humpCamelBack_40 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('6humpCamelBack', 30);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('6humpCamelBack', 30);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('6humpCamelBack', 30);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('6humpCamelBack', 30);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_6humpCamelBack_30 Result_BBA1
% save BBA1_OA_6humpCamelBack_30 Result_BBA1_OA
% save SBA1_6humpCamelBack_30 Result_SBA1
% save SBA1_OA_6humpCamelBack_30 Result_SBA1_OA
% 
% clear
% clc
% 
% %%
% %%
% %%
% 
% %% Sphere_10
% 
% %100
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 100);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 100);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 100);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 100);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_100 Result_BBA1
% save BBA1_OA_Sphere_10_100 Result_BBA1_OA
% save SBA1_Sphere_10_100 Result_SBA1
% save SBA1_OA_Sphere_10_100 Result_SBA1_OA
% 
% clear
% clc
% 
% %90
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 90);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 90);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 90);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 90);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_90 Result_BBA1
% save BBA1_OA_Sphere_10_90 Result_BBA1_OA
% save SBA1_Sphere_10_90 Result_SBA1
% save SBA1_OA_Sphere_10_90 Result_SBA1_OA
% 
% clear
% clc
% 
% %80
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 80);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 80);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 80);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 80);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_80 Result_BBA1
% save BBA1_OA_Sphere_10_80 Result_BBA1_OA
% save SBA1_Sphere_10_80 Result_SBA1
% save SBA1_OA_Sphere_10_80 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% %70
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 70);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 70);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 70);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 70);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_70 Result_BBA1
% save BBA1_OA_Sphere_10_70 Result_BBA1_OA
% save SBA1_Sphere_10_70 Result_SBA1
% save SBA1_OA_Sphere_10_70 Result_SBA1_OA
% 
% clear
% clc
% 
% %60
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 60);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 60);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 60);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 60);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_60 Result_BBA1
% save BBA1_OA_Sphere_10_60 Result_BBA1_OA
% save SBA1_Sphere_10_60 Result_SBA1
% save SBA1_OA_Sphere_10_60 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 50);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 50);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 50);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 50);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_50 Result_BBA1
% save BBA1_OA_Sphere_10_50 Result_BBA1_OA
% save SBA1_Sphere_10_50 Result_SBA1
% save SBA1_OA_Sphere_10_50 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 40);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 40);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 40);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 40);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_40 Result_BBA1
% save BBA1_OA_Sphere_10_40 Result_BBA1_OA
% save SBA1_Sphere_10_40 Result_SBA1
% save SBA1_OA_Sphere_10_40 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Sphere_10', 30);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Sphere_10', 30);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Sphere_10', 30);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Sphere_10', 30);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Sphere_10_30 Result_BBA1
% save BBA1_OA_Sphere_10_30 Result_BBA1_OA
% save SBA1_Sphere_10_30 Result_SBA1
% save SBA1_OA_Sphere_10_30 Result_SBA1_OA

% clear
% clc

%%
%%
%%

% %% Griewangk
% 
% 
% %100
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 100);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 100);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 100);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 100);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_100 Result_BBA1
% save BBA1_OA_Griewangk_10_100 Result_BBA1_OA
% save SBA1_Griewangk_10_100 Result_SBA1
% save SBA1_OA_Griewangk_10_100 Result_SBA1_OA
% 
% clear
% clc
% 
% %90
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 90);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 90);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 90);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 90);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_90 Result_BBA1
% save BBA1_OA_Griewangk_10_90 Result_BBA1_OA
% save SBA1_Griewangk_10_90 Result_SBA1
% save SBA1_OA_Griewangk_10_90 Result_SBA1_OA
% 
% clear
% clc
% 
% %80
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 80);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 80);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 80);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 80);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_80 Result_BBA1
% save BBA1_OA_Griewangk_10_80 Result_BBA1_OA
% save SBA1_Griewangk_10_80 Result_SBA1
% save SBA1_OA_Griewangk_10_80 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% %70
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 70);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 70);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 70);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 70);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_70 Result_BBA1
% save BBA1_OA_Griewangk_10_70 Result_BBA1_OA
% save SBA1_Griewangk_10_70 Result_SBA1
% save SBA1_OA_Griewangk_10_70 Result_SBA1_OA
% 
% clear
% clc
% 
% %60
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 60);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 60);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 60);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 60);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_60 Result_BBA1
% save BBA1_OA_Griewangk_10_60 Result_BBA1_OA
% save SBA1_Griewangk_10_60 Result_SBA1
% save SBA1_OA_Griewangk_10_60 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 50);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 50);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 50);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 50);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_50 Result_BBA1
% save BBA1_OA_Griewangk_10_50 Result_BBA1_OA
% save SBA1_GGriewangk_10_50 Result_SBA1
% save SBA1_OA_Griewangk_10_50 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 40);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 40);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 40);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 40);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_40 Result_BBA1
% save BBA1_OA_Griewangk_10_40 Result_BBA1_OA
% save SBA1_Griewangk_10_40 Result_SBA1
% save SBA1_OA_Griewangk_10_40 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Griewangk_10', 30);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Griewangk_10', 30);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Griewangk_10', 30);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Griewangk_10', 30);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Griewangk_10_30 Result_BBA1
% save BBA1_OA_Griewangk_10_30 Result_BBA1_OA
% save SBA1_GGriewangk_10_30 Result_SBA1
% save SBA1_OA_Griewangk_10_30 Result_SBA1_OA
% 
% clear
% clc
% 
% %%
% %%
% %%
% 
% %% Rosenbrock
% 
% 
% 
% %100
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 100);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 100);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 100);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 100);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_100 Result_BBA1
% save BBA1_OA_Rosenbrock_10_100 Result_BBA1_OA
% save SBA1_Rosenbrock_10_100 Result_SBA1
% save SBA1_OA_Rosenbrock_10_100 Result_SBA1_OA
% 
% clear
% clc
% 
% %90
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 90);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 90);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 90);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 90);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_90 Result_BBA1
% save BBA1_OA_Rosenbrock_10_90 Result_BBA1_OA
% save SBA1_Rosenbrock_10_90 Result_SBA1
% save SBA1_OA_Rosenbrock_10_90 Result_SBA1_OA
% 
% clear
% clc
% 
% %80
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 80);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 80);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 80);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 80);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_80 Result_BBA1
% save BBA1_OA_Rosenbrock_10_80 Result_BBA1_OA
% save SBA1_Rosenbrock_10_80 Result_SBA1
% save SBA1_OA_Rosenbrock_10_80 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% %70
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 70);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 70);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 70);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 70);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_70 Result_BBA1
% save BBA1_OA_Rosenbrock_10_70 Result_BBA1_OA
% save SBA1_Rosenbrock_10_70 Result_SBA1
% save SBA1_OA_Rosenbrock_10_70 Result_SBA1_OA
% 
% clear
% clc
% 
% %60
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 60);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 60);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 60);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 60);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_60 Result_BBA1
% save BBA1_OA_Rosenbrock_10_60 Result_BBA1_OA
% save SBA1_Rosenbrock_10_60 Result_SBA1
% save SBA1_OA_Rosenbrock_10_60 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 50);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 50);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 50);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 50);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_50 Result_BBA1
% save BBA1_OA_Rosenbrock_10_50 Result_BBA1_OA
% save SBA1_Rosenbrock_10_50 Result_SBA1
% save SBA1_OA_Rosenbrock_10_50 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 40);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 40);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 40);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 40);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_40 Result_BBA1
% save BBA1_OA_Rosenbrock_10_40 Result_BBA1_OA
% save SBA1_Rosenbrock_10_40 Result_SBA1
% save SBA1_OA_Rosenbrock_10_40 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rosenbrock_10', 30);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rosenbrock_10', 30);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rosenbrock_10', 30);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rosenbrock_10', 30);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rosenbrock_10_30 Result_BBA1
% save BBA1_OA_Rosenbrock_10_30 Result_BBA1_OA
% save SBA1_Rosenbrock_10_30 Result_SBA1
% save SBA1_OA_Rosenbrock_10_30 Result_SBA1_OA
% 
% clear
% clc
% 
% %%
% %%
% %%
% 
% %% Rastrigin
% 
% 
% %100
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 100);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 100);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 100);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 100);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_100 Result_BBA1
% save BBA1_OA_Rastrigin_10_100 Result_BBA1_OA
% save SBA1_Rastrigin_10_100 Result_SBA1
% save SBA1_OA_Rastrigin_10_100 Result_SBA1_OA
% 
% clear
% clc
% 
% %90
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 90);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 90);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 90);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 90);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_90 Result_BBA1
% save BBA1_OA_Rastrigin_10_90 Result_BBA1_OA
% save SBA1_Rastrigin_10_90 Result_SBA1
% save SBA1_OA_Rastrigin_10_90 Result_SBA1_OA
% 
% clear
% clc
% 
% %80
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 80);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 80);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 80);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 80);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_80 Result_BBA1
% save BBA1_OA_Rastrigin_10_80 Result_BBA1_OA
% save SBA1_Rastrigin_10_80 Result_SBA1
% save SBA1_OA_Rastrigin_10_80 Result_SBA1_OA
% 
% clear
% clc
% 
% 
% %70
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 70);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 70);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 70);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 70);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_70 Result_BBA1
% save BBA1_OA_Rastrigin_10_70 Result_BBA1_OA
% save SBA1_Rastrigin_10_70 Result_SBA1
% save SBA1_OA_Rastrigin_10_70 Result_SBA1_OA
% 
% clear
% clc
% 
% %60
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 60);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 60);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 60);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 60);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_60 Result_BBA1
% save BBA1_OA_Rastrigin_10_60 Result_BBA1_OA
% save SBA1_Rastrigin_10_60 Result_SBA1
% save SBA1_OA_Rastrigin_10_60 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 50);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 50);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 50);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 50);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_50 Result_BBA1
% save BBA1_OA_Rastrigin_10_50 Result_BBA1_OA
% save SBA1_Rastrigin_10_50 Result_SBA1
% save SBA1_OA_Rastrigin_10_50 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 40);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 40);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 40);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 40);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_40 Result_BBA1
% save BBA1_OA_Rastrigin_10_40 Result_BBA1_OA
% save SBA1_Rastrigin_10_40 Result_SBA1
% save SBA1_OA_Rastrigin_10_40 Result_SBA1_OA
% 
% clear
% clc
% 
% %50
% for tour=1:50
% [Result_BBA1(tour).it , Result_BBA1(tour).OptCost, Result_BBA1(tour).NFE] = Function_BBA1('Rastrigin_10', 30);
% Result_BBA1(tour).BestCost = Result_BBA1(tour).OptCost(end);
% 
% [Result_BBA1_OA(tour).it , Result_BBA1_OA(tour).OptCost, Result_BBA1_OA(tour).NFE] = Function_BBA1_OA('Rastrigin_10', 30);
% Result_BBA1_OA(tour).BestCost = Result_BBA1_OA(tour).OptCost(end);
% 
% [Result_SBA1(tour).it , Result_SBA1(tour).OptCost, Result_SBA1(tour).NFE] = Function_SBA1('Rastrigin_10', 30);
% Result_SBA1(tour).BestCost = Result_SBA1(tour).OptCost(end);
% 
% [Result_SBA1_OA(tour).it , Result_SBA1_OA(tour).OptCost, Result_SBA1_OA(tour).NFE] = Function_SBA1_OA('Rastrigin_10', 30);
% Result_SBA1_OA(tour).BestCost = Result_SBA1_OA(tour).OptCost(end);
% end
% save BBA1_Rastrigin_10_30 Result_BBA1
% save BBA1_OA_Rastrigin_10_30 Result_BBA1_OA
% save SBA1_Rastrigin_10_30 Result_SBA1
% save SBA1_OA_Rastrigin_10_30 Result_SBA1_OA
