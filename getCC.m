function cc = getCC( range , n )
%getCC Центр эллипсоида, элементы в диапазоне -range..range, хотя это неважно, длина n

    cc = range - rand(n,1) * 2 * range;

end