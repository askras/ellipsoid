function cc = getCC( range , n )
%getCC ����� ����������, �������� � ��������� -range..range, ���� ��� �������, ����� n

    cc = range - rand(n,1) * 2 * range;

end