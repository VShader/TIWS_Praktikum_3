% Autor:
% Datum: 14.11.2013

%Aufgabe 1: (Binärbäume und Listen)
%präorder(Xb,Ys) : Xb ist ein Baum, Ys die Liste der Baumknoten in präorder.
präorder([],[]).
präorder([X|[Lb,Rb]],Ys) :- präorder(Lb,H1s), präorder(Rb,H2s), append([X],H1s,H3s), append(H3s,H2s,Ys).

%Q präorder([b, [a,[],[]] ,[]],Z).
%Q präorder([b, [a,[],[]] ,[c,[],[]]],Z).
%Q präorder([d, [b,[a,[],[]],[c,[],[]]] ,[f,[e,[],[]],[g,[],[]]]],Z).
%                 d
%              b     f
%             a c   e  g

%postorder(Xb,Ys)
postorder([],[]).
postorder([X|[Lb,Rb]],Ys) :- postorder(Lb,H1s), postorder(Rb,H2s), append(H1s,H2s,H3s), append(H3s,[X],Ys).

%tiefe(Xb,Ys)
tiefe([],[]).
tiefe([X|[Lb,Rb]],Ys) :- tiefe(Lb,H1s), tiefe(Rb,H2s), append(H1s,[X],H3s), append(H3s,H2s,Ys).

%roots(Xbs,Ys)
roots([],[]) :-!.
roots([Xb|Ybs],Es) :- root(Xb,X1), roots(Ybs,H1s), append([X1],H1s,Es).

%Q roots([[b,[a,[],[]],[]],  [f,[e,[],[]],[]]],Zs).
%Q roots([[d, [b,[a,[],[]],[c,[],[]]] ,[f,[e,[],[]],[g,[],[]]]],  [d, [b,[a,[],[]],[c,[],[]]] ,[f,[e,[],[]],[g,[],[]]]]],Zs).


%Sonderufgabe (außer Konkrruenz)
%breite(Xb,Ys).
%breite([X|[Lb,Rb]],Ys) :- roots(Lb,H1s), roots(Rb,H2s), breite(), append(H1s,H2s,Ys).


%Aufgabe 2: (Türme von Hanoi)
%tof(X,Ys).
tof(N,Ys) :- move(N,a,b,c,Ys).

%move(N,A,B,C,Ys)
move(1,A,B,C,[von, A, nach, B]) :-!.
move(N,A,B,C,Ys) :- Hn is N-1, move(Hn,A,C,B,H1s), move(Hn,C,B,A,H2s), append(H1s,[von, A, nach, B],H3s), append(H3s,H2s,Ys).


%Aufgabe 3: (Quicksort)
%quicksort : erstelle linke liste mit allen die <= als Pivotelement und rechte mit >.
qsort([],[]) :-!.
qsort([X|Xs],Ys) :- leftlist(Xs,X,Ls), rightlist(Xs,X,Rs), qsort(Ls,E1s), qsort(Rs,E2s),  append(E1s,[X],E3s), append(E3s,E2s,Ys).

leftlist([],_,[]) :-!.
leftlist([X|Xs],Piv,Ys) :- X =< Piv, !, leftlist(Xs,Piv,Hs), append(Hs,[X],Ys).
leftlist([X|Xs],Piv,Ys) :- leftlist(Xs,Piv,Ys).

rightlist([],_,[]) :-!.
rightlist([X|Xs],Piv,Ys) :- X > Piv, !, rightlist(Xs,Piv,Hs), append([X],Hs,Ys).
rightlist([X|Xs],Piv,Ys) :- rightlist(Xs,Piv,Ys).




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
