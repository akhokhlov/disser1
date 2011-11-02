disp ('1. Zero set');
disp ('intersection([], [2,5]) == []') ;
A = []; 
B = [2,5];
disp (['A = ' num2str (A)]) ;
disp (['B = ' num2str (B)]) ;
intersection(A, B) == []

disp ('2. Zero result');
disp ('intersection([1,3], [4,5]) == []') ;
intersection([1,3], [4,5]) == []

disp ('3. c захлестом');
disp ('intersection([1,3], [2,5]) == [2,3]') ;
intersection([1,3], [2,5]) == [2,3]




