% Facts: Defining the animals
cat(fubby).
dog(figaro).

% Facts: Characteristics of the pets
has_spots(fubby, black).
has_spots(figaro, white).

% Rule: Mary owns a pet if it is a cat and has black spots
owns(mary, X) :- cat(X), has_spots(X, black).

% Rule: If someone owns something, they love it
loves(Person, Pet) :- owns(Person, Pet).

% Queries and Expected Answers:
% ?- cat(X).
% X = fubby.

% ?- owns(X, Y).
% X = mary, Y = fubby.

% ?- loves(X, Y).
% X = mary, Y = fubby.

% ?- owns(mary, _).
% true.
