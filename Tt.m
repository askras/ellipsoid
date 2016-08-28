function var = Tt(MM)

    [m n] = size(MM);
  
    U = genOGR(m,MM(:,1));
    
    for j = 2:1:n
        U = [U genOGR(m, MM(:,j))];
    end
    
    var = U';
end