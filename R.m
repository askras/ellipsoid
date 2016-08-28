function var = R(A, fi)
    
    [n n] = size(A);

    u = zeros(n,1);
    u(1) = cos(fi);
    u(2) = sin(fi);
    
    var = 1 / (sqrt(u'*A*u));
    
end