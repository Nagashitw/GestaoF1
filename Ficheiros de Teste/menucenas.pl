%descrescente

opcoes_modificar_piloto(N_piloto):-write('Que dados do piloto quer modificar? Seleccione a opcao correspondente. '),nl,
write(' 1	Equipa'),nl,
write(' 2	Morada'),nl,
write(' 3	Naturalidade'),nl,
write(' 4	Pontuacao'),nl,
write(' Pedimos desculpa mas nao e possivel modificar os campos de ID, nome , data de nascimento e Lista de Titulos'),nl,nl,
write('Opcao: '),
read(Op),nl,