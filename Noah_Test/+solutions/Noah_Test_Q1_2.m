function counter = Noah_Test_Q1_2(matrix, target)

size_test = size(matrix);

counter = 0;

size_target = size(target);

for row = 1 : size_test(2) - size_target(2) + 1

    for col = 1 : size_test(1) - size_target(1) + 1

        if sum(matrix(col : col + size_target(1) - 1, row : row + size_target(2) - 1) > target, 'all') == 4

            counter = counter + 1;

        end

    end

end

end
