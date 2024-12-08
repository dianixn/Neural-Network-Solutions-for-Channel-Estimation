function output = Noah_Test_Q1_1(input)

index = 3;

output = cell(3, 1);

% First rule

dec_values = cellfun(@(v) functions.dec2base_doubel(10, v), input);
values = sort(dec_values, 'descend');
Values = values(1:index);

Decimal_value = rem(floor(Values' * 10 .^ (1 - 4 : 0)), 10);

for i = 1 : index
    output{i} = Decimal_value(i, :);
end

end
