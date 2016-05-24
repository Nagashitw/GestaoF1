pesquisar_f_auxiliar_lista_resultados([]):-write('Nao tem mais resultados a mostrar'),nl.
pesquisar_f_auxiliar_lista_resultados([C|Cauda]):-write(C),write(' - '),mostrar_f_auxiliar_mostra_nome_piloto(C,Proprio,Apelido),write(Proprio),write(' '),write(Apelido),nl, pesquisar_f_auxiliar_lista_resultados(Cauda).
mostrar_f_auxiliar_mostra_nome_piloto(C,Proprio,Apelido):-setof(C,piloto(C,_,nome(Proprio,Apelido),_,_,_,_,_),_).




listar_resultados_com_dados_piloto:-consult('pistas.pl'),consult('resultados.pl'),consult('piloto.pl'),
									 write('Digite a data da prova: '),nl,
									 write('Dia: '),read(Dia),nl,
									 write('Mes: '),read(Mes),nl,
									 write('Ano: '),read(Ano),nl,
				findall(resultados(Id_pista,dataprova(Dia,Mes,Ano),LR),
						resultados(Id_pista,dataprova(Dia,Mes,Ano),LR),L),mostrar_resultados_identificacao(L).
mostrar_resultados_identificacao([]):-!,write('Nao existem resultados ').
mostrar_resultados_identificacao([resultados(Id_pista,dataprova(Dia,Mes,Ano),LR)|Cauda]):-
write('  ID Pista: '),write(Id_pista),nl,
write('  Data da prova:  '),write(Dia),write('-'),write(Mes),write('-'),write(Ano),nl,
write('  Lista de Resultados por ordem crescente:  '),nl,pesquisar_f_auxiliar_lista_resultados(LR),nl,mostrar_resultados_identificacao(Cauda),nl.

bubble(0, Res, Res, sorted).
bubble(Len, [A,B|T], Res, unsorted) :- A > B, !, bubble(Len,[B,A|T], Res, _).
bubble(Len, [A|T], [A|Ts], Ch) :- L is Len-1, bubble(L, T, Ts, Ch).
 
bubblesort(In, Out) :- length(In, Len), bubblesort(Len, In, Out).
bubblesort(0, In, In).
bubblesort(Len, In, Out) :-
	bubble(Len, In, Bubbled, SortFlag),  % bubble the list
	(SortFlag=sorted -> Out=Bubbled;     % list is already sorted
	 SegLen is Len - 1,		     % one fewer to process
	 writef('bubbled=%w\n', [Bubbled]),  % show progress
	 bubblesort(SegLen, Bubbled, Out)).
 
test :-  In = [8,9,1,3,4,2,6,5,4],
	 writef('  input=%w\n', [In]),
	 bubblesort(In, R),
	 writef('-> %w\n', [R]).

	 %contar_numero_elementos_lista de elementos de uma lista
contar_numero_elementos_lista([],N):- N=0.
contar_numero_elementos_lista([C|Cauda],N):- contar_numero_elementos_lista(Cauda,N1), N is N1+1.
