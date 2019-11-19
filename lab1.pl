man('Bil').
man('Alex').
man('Victor').
man('Selin').
man('Moris').
man('Bobby').
man('Jack').
man('Serzh').
man('Horst').

woman('Elizabeth').
woman('Zhanetta').
woman('Margo').
woman('Ivetta').
woman('Helga').
woman('Muzetta').

married('Bil', 'Elizabeth').
married('Alex', 'Zhanetta').
married('Moris', 'Helga').
married('Victor', 'Ivetta').
married('Jack', 'Muzetta').

parent('Bil', 'Margo').
parent('Bil', 'Victor').
parent('Elizabeth', 'Margo').
parent('Elizabeth', 'Victor').

parent('Alex', 'Ivetta').
parent('Alex', 'Selin').
parent('Zhanetta', 'Ivetta').
parent('Zhanetta', 'Selin').

parent('Moris', 'Muzetta').
parent('Helga', 'Muzetta').

parent('Victor', 'Bobby').
parent('Victor', 'Jack').
parent('Ivetta', 'Bobby').
parent('Ivetta', 'Jack').

parent('Jack', 'Serzh').
parent('Jack', 'Horst').
parent('Muzetta', 'Serzh').
parent('Muzetta', 'Horst').

father(A, B) :- man(A), parent(A, B).
mother(A, B) :- woman(A), parent(A, B).

son(A, B) :- man(A), parent(B, A).
daughter(A, B) :- woman(A), parent(B, A).

sibling(A, B) :- parent(C, A), parent(C, B).
brother(A, B) :- man(A), sibling(A, B).
sister(A, B) :- woman(A), sibling(A, B).

uncle(A, B) :- man(A), sibling(A, C), parent(C, B).
aunt(A, B) :- woman(A), sibling(A, C), parent(C, B).

grandfather(A, B) :- man(A), parent(A, C), parent(C, B).
grandmother(A, B) :- woman(A), parent(A, C), parent(C, B).

grandson(A, B) :- man(A), parent(C, A), parent(B, C).
granddaughter(A, B) :- woman(A), parent(C, A), parent(B, C).

nephew(A, B) :- man(A), uncle(B, A).
niece(A, B) :- woman(A), aunt(B, A).

mother_in_law(A, B) :- married(A, C), mother(B, C).
father_in_law(A, B) :- married(A, C), father(B, C).

sibling_in_law(A, B) :- married(A, C), sibling(B, C).

grandnephew(A, B) :- grandson(A, C), sibling(B, C).
grandniece(A, B) :- granddaughter(A, C), sibling(B, C).
