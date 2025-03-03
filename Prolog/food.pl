% Facts
food(burger).
food(sandwich).
food(pizza).

lunch(sandwich).
dinner(pizza).

% Rule: Every food is a meal
meal(X) :- food(X).

% Queries and Expected Answers:
% ?- food(pizza).
% true.

% ?- meal(X), lunch(X).
% X = sandwich.

% ?- dinner(sandwich).
% false.
