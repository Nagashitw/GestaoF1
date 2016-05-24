menu_backups:-write('Escolha a Opcao: '),nl,
write('1- Exportar Ficheiros para Backup '),nl,
write('2- Importar Ficheiros de Backup '),nl,
read(Opcao),nl,backup(Opcao).

backup(1):- copiaficheiro('piloto.pl','backups/piloto_backup.pl'),
	copiaficheiro('pistas.txt','backups/pistas_backup.txt'),
	copiaficheiro('resultados.pl','backups/resultados_backup.pl').



%------------------------------------------------------------------------------------------------------------------
%                                  Importar ficheiros de backup Opçao 25
%------------------------------------------------------------------------------------------------------------------
backup(2):- copiaficheiro('backups/piloto_backup.pl','piloto.pl'),
	copiaficheiro('backups/pistas_backup.txt','pistas.txt'),
	copiaficheiro('backups/resultados_backup.pl','resultados.pl').

copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.