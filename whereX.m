function var = whereX(n)
    
    U = zeros(n*(n+1)/2,2);
    c = 0;
    for i = 1:1:n
        for j = 1:1:i
            c = c + 1;
            U(c,1) = i;
            U(c,2) = j;
        end
    end
    
    var = U;
end