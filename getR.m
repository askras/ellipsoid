function R = getR( Q, fi)
%getR ��������������� �������, ������������ ��� ��������� ��������� �������
% 2d-������� ���������� ��������������� X1-0-X2
    
    [n n] = size(Q);

    u = zeros(n,1);
    u(1) = cos(fi);
    u(2) = sin(fi);
    
    A = Q*Q % ������� ���������� ��� �������������  0<=(x-c)T*A*(x-c)<=1, ������� n x n
    
    R = 1 / (sqrt(u'*A*u));
    
end