% 通量增益由通过次数k的迭代函数表示，
% 损耗由通过谐振器或反射镜阵列的单程传输表示 T = exp(-l)，
% 损耗系数l包括输出耦合损耗以及来自散射，吸收和反射的内部损耗。
% 初始能量密度取为J_0 = 10^{-3}J_s；但是，该结果对该值并不敏感，因为直到最后几遍都几乎没有提取能量。
T = 0.95; % 0.95 高传输值
% 饱和通量 saturaion fluence J_s
Js = 0.9;
% 小信号增益 small-signal gain G(z)
G = 1.35;
% no recovery p=1, fully recovery p=0.5
p = 1; 
% 增益系数 g_k = lnG_k
g = log(G);
%
x = 0:0.000001:Js/100;
Jii = x;
GG = [];
Jk = [];
Kk = [];
gk = [];
for i = 1:60
%    Ji(find(Ji<th)) = 0;
%     y0(i) = Ji(1);
%     if (Ji < 0)
%          Ji = 0;
%     end
    %Ji(find(Ji<0)) = 0;
    G = exp(g);
    Ji = Jii;
    k = log(G.* (exp(Ji/Js) - 1)+1);
    Jii = T*Js*k;
    g = g - p * (Jii/T - Ji) / Js;
    G = exp(g);
    GG = cat(1,GG,G);
    Jk = cat(1,Jk,Jii/Js);
    Kk = cat(1,Kk,k);
    gk = cat(1,gk,g./0.3);
end

plot(x,Jii)
figure(2)
[lenX,lenY] = size(GG);
[X,Y]=meshgrid(1:lenY,1:lenX);
meshz(X, Y, GG)
figure(3)
meshz(X,Y, Jk);
figure(4) 
meshz(X,Y, Kk);
figure(5)  
meshz(X,Y, gk);
% figure(2)
% i = 1:30;
% plot(i,y0)
% myfunc = inline('beta(4)./(beta(1)+beta(2).*exp(-beta(3).*x+2))','beta','x');
% beta0 = [0.2,30,1,1]';%待定系数的预估值
% beta = nlinfit(x,Ji,myfunc,beta0);% 
% % beta(2) = 1;
% 
% y = beta(4)./(beta(1)+beta(2).*exp(-beta(3).*x+2));
% hold on
% plot(x,y)