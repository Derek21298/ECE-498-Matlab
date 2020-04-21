function y = diff_eq(x, y0)
    y = zeros(3,1); 
    y(1) = 2*y0(1) + y0(2) + 5*y0(3) + exp(-2*x);
    y(2) = -3*y0(1) -2*y0(2) - 8*y0(3) + 2*exp(-2*x) - cos(3*x);
    y(3) = 3*y0(1) + 3*y0(2) + 2*y0(3) + cos(3*x);
end

