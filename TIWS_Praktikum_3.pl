% Autor:
% Datum: 14.11.2013

%Aufgabe 1:
%präorder(Xb,Ys) : Xb ist ein Baum, Ys die Liste der Baumknoten in präorder.
präorder([X|[Lb,Rb]],Ys) :- päorder(Lb,Hs), append([X],Hs,Ys).

%postorder(Xb,Ys)

%tiefe(Xb,Ys)

%roots(Xbs,Ys)

%Hilfskonstrukte
%bintree(Xb) : Xb ist ein Binärbaum
bintree([]).
bintree([X|[Lb,Rb]]) :- bintree(Lb), bintree(Rb).
%bintree(list(X,list(R))

%root(Xb,X) : Xb ist ein Baum, X ist die Wurzel des Baumes Xb.
root([X|[Lb,Rb]],X).

%left(Xb,Lb) : Xb ist ein Baum, Lb ist der linke Teilbaum von Xb.
left([X|[Lb,Rb]],Lb).

%right(Xb,Rb) : Xb ist ein Baum, Rb ist der rechte Teilbaum von Xb.
right([X|[Lb,Rb]],Rb).

dosort([],[]).
swap(X,Y,Rs)  .

%quicksort : erstelle linke liste mit allen die <= als Pivotelement und rechte mit >.
qsort([],[]) :-!.
qsort([X|Xs],Ys) :- dupList([X|Xs]), !, append([X|Xs],[],Ys).
qsort([X|Xs],Ys) :- partlist([X|Xs],X,Ls,Rs), qsort(Ls,E1s), qsort(Rs,E2s), append(E1s,E2s,Ys).

partlist([],_,[],[]).
partlist([X|Xs],Piv,Ls,Rs) :- X =< Piv,! , partlist(Xs,Piv,Hs,Rs), append(Hs,[X],Ls).
partlist([X|Xs],Piv,Ls,Rs) :- partlist(Xs,Piv,Ls,Hs), append([X],Hs,Rs).

dupList([X|[]]).
dupList([X|[X|Xs]]) :- dupList([X|Xs]).

%partlist([3,2,4],3,[2,3],[4]).
%partlist([2,3],2,[2],[3]).
%leftlist([3,2,4],3,[2,3]).
%rightlist([3,2,4],3,[4]).
%leftlist([2,3],2,[2]).
%rightlist([2,3],2,[3]).













tof(X,Ys) .

hanoi(1,A,B,_,[zug(A,B)]).
hanoi(N,A,B,C,Z) :- M is N-1, hanoi(M,A,C,B,Z1), hanoi(M,C,B,A,Z2), append(Z1,[zug(A,B)|Z2],Z).














han(X,Ys) :- zug(X,A,B,C,Ys).
zug(1,A,B,C,[von,a,nach,c]).
zug(N,A,B,C,Es) :- M is N-1, zug(M,A,B,C,Es).