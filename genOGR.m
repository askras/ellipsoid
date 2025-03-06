function var = genOGR(n,x)

    X = whereX(n);
    [k p] = size(X);

    u = zeros(k,1);

    for j = 1:1:k
        I = X(j,1);
        J = X(j,2);
        u(j) = x(I)*x(J)*(1+(I~=J));
    end

    var = u;
end
