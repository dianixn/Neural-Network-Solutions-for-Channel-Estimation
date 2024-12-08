function hp = EstiamteSquaredKSD(x, y)

hp = log(sqrt(2 * pi)) * (log(sqrt(2 * pi)) - 2) * x .* y .* exp(-(x - y) .^ 2 / 2) + y.^2 * log(sqrt(2 * pi)) .* exp(-(x - y) .^ 2 / 2) + x.^2 * log(sqrt(2 * pi)) .* exp(-(x - y) .^ 2 / 2) + (1-(x-y).^2) .* exp(-(x - y) .^ 2 / 2); 
