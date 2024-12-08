%Please specific the base of this log, I will go for e

%% Q3 - 1

range = [10, 20, 30, 40, 50]; 

Vn = zeros(length(range), 1); 

for n = range

    x = functions.randl(n, 1);
    y = functions.randl(n, 1);

    hp = solutions.EstiamteSquaredKSD(x, y);

    Vn(n == range) = mean(hp, 'all');

end

Vn

%% Q3 - 2
%如果n没有被定义两次（多重定义）那就是我理解错了，Bn是个index 1到100的集合，但不是sample的n？

Decision = zeros(length(range), 1); 

for n = range

    decision = zeros(100, 1);
    Thresold = 0; 

    for i = 1 : 100

        x = functions.randl(n, 100);
        y = functions.randl(n, 100);

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

        decision(i) = 1;

    else

        decision(i) = 0;

    end

    end

    Decision(n == range) = mode(decision);

end

Decision

%% Q3 - 3

% In the page 7 of this paper, they said there's parameter could reduce this complexity
% but will cause some potential error. Basicly it means look at a subset
% only, l think the idea is similar to the mini-batch training
