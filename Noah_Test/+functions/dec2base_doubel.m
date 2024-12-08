function Based_value = dec2base_doubel(Base_value, Decimal_value)

    Based_value = sum(power(Base_value, [0 : length(Decimal_value) - 1]) .* fliplr(Decimal_value));

end
