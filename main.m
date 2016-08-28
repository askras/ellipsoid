clc
clear
format short%long


%% 

n = 3; % Размерность "точки"
m = 4000; % Количество точек

%cc
range = 10;
cc = range - rand(n,1) * 2 * range;

%Q 
% Здесь пытаемся "железно" сформировать полноранговую матрицу
isFullRank = false;
while isFullRank == false
    M = 1 - rand(n,n) * 2; %cоздаем случайную матрицу M, размера n x n
    M = triu(M) + triu(M,1)'; %  берем только верхнюю половинку и отображаем ее относительно гл. диагонали
    if rank(M) == n;
        isFullRank = true;
        Q = M;
        disp('Q - полноранговая матрица')
    end
end

%A
A = Q * Q;

%S
S = inv(Q);

%M
M = [];
for i = 1:1:m
    z = 1 - rand(n,1) * 2;
    nz = sqrt(z'*z);
    p = (Q \ z) * rand(1) / nz;   % (Q \ z) <==> (inv(Q) * z)
    Mj = [p + cc ; 1]';
    M = [M ; Mj];
end
disp(['Размерность матрицы M: ' int2str(size(M))])

%TT
TT = Tt(M');

%L
L = ones(m,1);

%O
O = zeros(m,1);

%cF
cF = Coef(n+1);

%% Решатель
AA = [TT;-TT];
bb = [L;O];
[aa fval] = linprog(-cF,AA,bb);


%% Проверки

maxL = max(TT*aa);
minL = min(TT*aa);

disp(['max(TT*aa) = ' num2str(maxL)])
disp(['min(TT*aa) = ' num2str(minL)])

%%

%W
W = gA(n+1,aa);

%B
B = W(1:n,1:n);

%b
b = W(1:n,n+1:n+1);

%beta
beta = W(n+1,n+1);

%k
k = 1 / (b'*inv(B)*b + 1 - beta);

%Ar
Ar = k * B;

%Delta
Delta = A - Ar;

%c
c = -inv(B)*b;

%delta
delta = cc - c;

%d0
d0 = 1 / sqrt(det(A));

%d1 
d1 = 1 / sqrt(det(Ar));

%eps
eps = 100 * (d1 - d0) / d0;


disp(['d0 = ' num2str(d0)])
disp(['d1 = ' num2str(d1)])
disp(['eps = ' num2str(eps)])


%% Графики
j = 1:1:m;
fi = 0;

hold on
plot(M(j,1),M(j,2),'+r');
plot(R(A,fi) * cos(fi) + cc(1), R(A,fi) * sin(fi) + cc(2),'ob');
plot(rr(Ar,fi) * cos(fi) + cc(1), rr(Ar,fi) * sin(fi) + cc(2),'-k');