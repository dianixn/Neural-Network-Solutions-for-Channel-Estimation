function decision = TestSamplesFromP(x, y)   

hp = solutions.EstiamteSquaredKSD(x, y);

Vn = mean(hp, 'all');

W = zeros(100, 1);
W(1) = 1;

for j = 2:100

    Ut = rand;
    W(j) = (Ut > 0.5) * W(j - 1) - (Ut <= 0.5) * W(j - 1);

end

Bn = zeros(100, 1);

for m = 1:100

    hp_tem = zeros(1, n);
    bn = zeros(m, m, n);

    for  k = 1:m

        for z = 1:m

            hp_tem = solutions.EstiamteSquaredKSD(x(:, k), y(:, z));
            bn(k, z, :) = W(k) * W(z) * hp_tem;

        end

    end

        Bn(m) = mean(bn, 'all');

end


    thresold = sort(Bn, 'descend');
    Thresold = thresold(0.1 * 100);
    
    if Vn > Thresold

        decision = 1;

    else

        decision = 0;

    end
