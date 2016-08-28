function var = Coef(n)

    X = whereX(n);
    [k p] = size(X);

    u = zeros(k,1);

    for j = 1:1:k
        I = X(j,1);
        J = X(j,2);
    
        u(j) = (I == J) & (j < k);
    end

    var = u;
end