function x = randl(m, n)

u1 = rand(m, n);
u2 = rand(m, n);

x = log(u1./u2);
x = bsxfun(@minus, x, mean(x));
x = bsxfun(@rdivide, x, std(x));

end