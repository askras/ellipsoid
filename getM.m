function M = getM( Q, cc, m)
%getM ���������� m ��������� n-������ �����, ������� ������ ����������
% ����� ������������ "1" � n+1-� ����������, ��� ��� "��������" ��������
% ������� ������
% � ����� n+1 - ������ ����� ������������ '�� �������', �������� ������� ����� ������� m,(n+1)
    
    [n n] = size(Q);
    U = [];
    
    for i = 1:1:m
       z = 1 - rand(n,1) * 2;
       nz = sqrt(z'*z);
       p = (Q \ z) * rand(1) / nz;   % (Q \ z) <==> (inv(Q) * z)
       Uj = [p + cc ; 1]';
       U = [U ; Uj];
    end
    
    M = U;
    
end