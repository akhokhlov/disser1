% непересекающиеся
A = []; 
B = [2,5];
coalition(A, B) == [2 5];

A = [2,5]; 
B = [];
coalition(A, B) == [2 5];

A = [1,2]; 
B = [3,5];
coalition(A, B) == [1 2 3 5];

% объединение с захлестом
A = [1,3]; 
B = [3,5];
coalition(A, B) == [1 5];

A = [3,5]; 
B = [1 4];
coalition(A, B) == [1 5];

% вложение
A = [3,5]; 
B = [1 7];
coalition(A, B) == [1 7];

% сложные множества
A = [1 2 3 5]; 
B = [1 3];
coalition(A, B) == [1 5];

A = [1 2 3 5]; 
B = [1 2 4 7];
coalition(A, B) == [1 2 3 7];



