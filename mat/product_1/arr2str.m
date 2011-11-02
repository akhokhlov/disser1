function str = arr2str(arr)
    if isempty(arr)
        str = '[]';
    elseif length(arr) == 2
        str = ['[' num2str(arr(1), 2) ',' num2str(arr(2), 2) ']'];
    elseif length(arr) == 4
        str = ['[' num2str(arr(1), 2) ',' num2str(arr(2), 2)  ',' num2str(arr(3), 2)  ',' num2str(arr(4), 2) ']'];
    else
        str = 'error';
    end
end