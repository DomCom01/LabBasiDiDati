create or replace PACKAGE gui as

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default 0);

procedure Reindirizza(indirizzo varchar2);

procedure ApriBody(idSessione int default 0);

procedure ChiudiBody;

procedure Bottone(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '', ident varchar2 default '', classe varchar2 default '');

procedure ApriDiv(ident varchar2 default '', classe varchar2 default '');

procedure ChiudiDiv;

procedure TopBar(saldo varchar2 default null);

end gui;