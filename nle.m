
function f = nle(x)
    f(1) = 3*x(1)*x(2) + x(2) - x(3) - 12;
    f(2) = x(1) + x(2)*x(1)^2 + x(3) - 12;
    f(3) = x(1) - x(2) - x(3) + 2;
end

