function var = rr(Ar, fi)

    [n n] = size(Ar);

    u = zeros(n,1);
    u(1) = cos(fi);
    u(2) = sin(fi);

    var = 1 / (sqrt(u'*Ar*u));

end
