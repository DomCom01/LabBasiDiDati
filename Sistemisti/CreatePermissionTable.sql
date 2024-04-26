
drop table Permissions;
create table Permissions(
  name varchar(100) not null,
  procedureUrl varchar(200) NOT NULL,
  users varchar2(100) not null,
  numberGroup integer not null,
  CONSTRAINT pkurl PRIMARY KEY (procedureUrl)
);
DECLARE
    u_url VARCHAR2(45) := 'http://131.114.73.203:8080/apex/d_commiso';
BEGIN
    --gruppo1
    INSERT INTO Permissions VALUES ('Visualizza Prenotazioni',u_url || '.gruppo1.visPren?p_idSess=', 'Cliente;Operatore', 1);
    INSERT INTO Permissions VALUES ('Inserisci Prenotazione', u_url || '.gruppo1.insPren?p_idSess=', 'Cliente;Operatore', 1);
    INSERT INTO Permissions VALUES ('Visualizza Prenotazioni Manager',u_url || '.gruppo1.mvp?p_idSess=', 'Manager', 1);
    INSERT INTO Permissions VALUES ('Visualizza prenotazioni pendenti future', u_url ||'.gruppo1.visPrenPenFut?p_idSess=', 'Operatore', 1);
    INSERT INTO Permissions VALUES ('Visualizza Corse',u_url || '.gruppo1.visCorseClA?p_idSess=', 'Cliente;Autista', 1);
    --gruppo2
    INSERT INTO Permissions VALUES ('Visualizza Taxi',u_url || '.gruppo2.visualizzaTaxi?id_ses=', 'Autista;Operatore;Manager;Cliente', 2);
    INSERT INTO Permissions VALUES ('Visualizza Corse Non Prenotate',u_url || '.gruppo2.visualizzaCorseNonPrenotate?id_ses=', 'Autista;Manager;Contabile;Cliente', 2);
    INSERT INTO Permissions VALUES ('Visualizza Optionals',u_url || '.gruppo2.visualizzaOptionals?id_ses=', 'Autista;Operatore;Manager;Cliente', 2);

    --gruppo3
    INSERT INTO Permissions VALUES ('Visualizza buste paga',u_url || '.Gruppo3.visualizzaBustePaga?idSess=', 'Contabile', 3);
    INSERT INTO Permissions VALUES ('Visualizza Buste Paga Dipendente',u_url || '.Gruppo3.visualizzaBustePagaDipendente?idSess=', 'Autista;Operatore;Contabile;Manager', 3);
    INSERT INTO Permissions VALUES ('Inserisci Buste Paga',u_url || '.Gruppo3.visualizzaRicaricheCliente?idSess=', 'Contabile', 3);
    INSERT INTO Permissions VALUES ('Visualizza Ricariche',u_url || '.Gruppo3.inserimentoBustaPaga?idSess=', 'Cliente', 3);
    INSERT INTO Permissions VALUES ('Dettagli Stipendi Personale',u_url || '.Gruppo3.dettagliStipendiPersonale?idSess=', 'Manager', 3);
    INSERT INTO Permissions VALUES ('Dettagli Ricariche Clientie',u_url || '.Gruppo3.dettagliRicaricheClienti?idSess=', 'Manager', 3);
    INSERT INTO Permissions VALUES ('Inserisci Convenzione',u_url || '.Gruppo3.inserimentoConvenzione?idSess=', 'Manager', 3);
    INSERT INTO Permissions VALUES ('Associa Convenzione',u_url || '.Gruppo3.associaConvenzione?idSess=', 'Manager', 3);
    INSERT INTO Permissions VALUES ('Visualizza Convenzioni',u_url || '.Gruppo3.visualizzaConvenzioni?idSess=', 'Cliente;Operatore;Manager', 3);
    INSERT INTO Permissions VALUES ('Visualizza Clienti',u_url || '.Gruppo3.visualizzaClienti?idSess=', 'Manager', 3);
    INSERT INTO Permissions VALUES ('Dettagli Convenzioni',u_url || '.Gruppo3.dettagliConvenzioni?idSess=', 'Manager', 3);


    --gruppo4
    INSERT INTO Permissions VALUES ('Visualizza revisioni',u_url || '.Gruppo4.visualizzazioneRevisione?idSessione=', 'Manager;Autista', 4);
    INSERT INTO Permissions VALUES ('Visualizzazione Dipendenti',u_url || '.Gruppo4.visualizzazioneDipendentiR?idSessione=', 'Autista;Operatore;Manager;Contabile', 4);
    INSERT INTO Permissions VALUES ('Visualizza turni',u_url || '.Gruppo4.visualizzazioneTurni?idSessione=', 'Manager;Operatore', 4);
    INSERT INTO Permissions VALUES ('Visualizza turni autista',u_url || '.Gruppo4.turniAutista?idSessione=', 'Autista', 4);
    INSERT INTO Permissions VALUES ('Inserisci turni',u_url || '.Gruppo4.inserimentoTurni?idSessione=', 'Manager', 4);
    INSERT INTO Permissions VALUES ('Copertura turni',u_url || '.Gruppo4.coperturaTurni?idSessione=', 'Manager', 4);
    INSERT INTO Permissions VALUES ('Statistiche autisti',u_url || '.Gruppo4.statisticheAutisti?idSessione=', 'Manager;Autista', 4);
END;
