% Autor:
% Datum: 14.11.2013

%Aufgabe 1: (Binärbäume und Listen)
%präorder(Xb,Ys) : Xb ist ein Baum, Ys die Liste der Baumknoten in präorder.
präorder([],[]).
präorder([X|[Lb,Rb]],Ys) :- präorder(Lb,H1s), präorder(Rb,H2s), append([X],H1s,H3s), append(H3s,H2s,Ys).

%Q präorder([1, [2,[],[]] ,[]],Z).
%Q präorder([5, [3,[],[]] ,[7,[],[]]],Z).
%Q präorder([5, [3,[2,[],[]],[4,[],[]]] ,[7,[6,[],[]],[8,[],[]]]],Z).
%                 5
%              3     7
%             2 4   6  8

%postorder(Xb,Ys)
postorder([],[]).
postorder([X|[Lb,Rb]],Ys) :- postorder(Lb,H1s), postorder(Rb,H2s), append(H1s,H2s,H3s), append(H3s,[X],Ys).

%tiefe(Xb,Ys)
tiefe([],[]).
tiefe([X|[Lb,Rb]],Ys) :- tiefe(Lb,H1s), tiefe(Rb,H2s), append(H1s,[X],H3s), append(H3s,H2s,Ys).


%roots(Xbs,Ys)
roots([],[]) :-!.
roots([Xb|Ybs],Es) :- root(Xb,X1), roots(Ybs,H1s), append([X1],H1s,Es).

%Q roots([[1, [2,[],[]] ,[]],[3, [4,[],[]] ,[]],[23, [32,[],[]] ,[]]],Zs).
%Q roots([[5, [3,[2,[],[]],[4,[],[]]] ,[7,[6,[],[]],[8,[],[]]]],[5, [3,[2,[],[]],[4,[],[]]] ,[7,[6,[],[]],[8,[],[]]]],[5, [3,[2,[],[]],[4,[],[]]] ,[7,[6,[],[]],[8,[],[]]]]],Zs).

%Hilfskonstrukte
%bintree(Xb) : Xb ist ein Binärbaum
bintree([]) :-!.
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


%Sonderufgabe (außer Konkrruenz)
%breite(Xb,Ys).
%breite([X|[Lb,Rb]],Ys) :- roots(Lb,H1s), roots(Rb,H2s), breite(), append(H1s,H2s,Ys).


%Aufgabe 2: (Türme von Hanoi)
%tof(X,Ys).
tof(N,Ys) :- move(N,1,3,2,Ys).

%move(N,A,B,C,Ys)
move(0,A,B,C,[]) :-!.
%move(1,A,B,C,[von, A, nach, B]) :-!.
move(N,A,B,C,Ys) :- Hn is N-1, move(Hn,A,C,B,H1s), move(Hn,C,B,A,H2s), append(H1s,[von, A, nach, B],H3s), append(H3s,H2s,Ys).


%Aufgabe 3: (Quicksort)
%quicksort : erstelle linke liste mit allen die <= als Pivotelement und rechte mit >.
qsort([],[]) :-!.
qsort([X|Xs],Ys) :- getPivot([X|Xs],Pivot,XPs), partlist(XPs,Pivot,Ls,Rs), qsort(Ls,E1s), qsort(Rs,E2s),  append(E1s,[Pivot],E3s), append(E3s,E2s,Ys).

partlist([],_,[],[]).
partlist([X|Xs],Piv,Ls,Rs) :- X =< Piv,! , partlist(Xs,Piv,Hs,Rs), append(Hs,[X],Ls).
partlist([X|Xs],Piv,Ls,Rs) :- partlist(Xs,Piv,Ls,Hs), append([X],Hs,Rs).

getPivot([X|Xs],X,Xs).

%partlist([3,2,4],3,[2,3],[4]).
%partlist([2,3],2,[2],[3]).
%leftlist([3,2,4],3,[2,3]).
%rightlist([3,2,4],3,[4]).
%leftlist([2,3],2,[2]).
%rightlist([2,3],2,[3]).