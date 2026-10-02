% The Simpsons Family Knowledge Base

% Gender facts

male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

% Father rule
father(X, Y) :- parent(X, Y), male(X).

% Mother rule
mother(X, Y) :- parent(X, Y), female(X).

% Son rule
son(X, Y) :- parent(Y, X), male(X).

% Daughter rule
daughter(X, Y) :- parent(Y, X), female(X).

% Brother rule
brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.

% Sister rule
sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.

% Grandfather rule
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% Aunt rule
aunt(X, Y) :- sister(X, P), parent(P, Y).

% Uncle rule
uncle(X, Y) :- brother(X, P), parent(P, Y).

% Cousin rule
cousin(X, Y) :- parent(P1, X), parent(P2, Y), parent(G, P1), parent(G, P2), P1 \= P2, X \= Y.

% Ancestor rules
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
