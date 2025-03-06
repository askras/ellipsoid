function var = gA(n,a)

    c = 0;
    U = zeros(n);

    for i = 1:1:n
        for j = 1:1:i
            c = c + 1;
            u = a(c);
            U(i,j) = u;
            U(j,i) = u;
        end
    end

    var = U;
end
