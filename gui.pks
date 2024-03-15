create or replace PACKAGE gui as

--TYPE vstring IS TABLE OF VARCHAR2(4000) INDEX BY BINARY_INTEGER; -- Tipo array di stringhe per la creazione delle tabelle

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default 0);

procedure Reindirizza(indirizzo varchar2);

procedure ApriBody(idSessione int default 0);

procedure ChiudiBody;

procedure Bottone(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '', ident varchar2 default '', classe varchar2 default '');

procedure ApriDiv(ident varchar2 default '', classe varchar2 default '');

procedure ChiudiDiv;

procedure TopBar(saldo varchar2 default null);

-- Procedure per Tabella
procedure ApriTabellaNonModificabile;
PROCEDURE ApriHeaderTabella;
procedure AggiungiHeaderTabella(elemento VARCHAR2 default '');
procedure ChiudiHeaderTabella;
procedure ApriBodyTabella;
procedure ChiudiTabella;
procedure AggiungiRigaTabella;
procedure ChiudiRigaTabella;
procedure AggiungiElementoTabella(elemento VARCHAR2 default '');

--procedure per Filtro Tabella
procedure ApriFormFiltro(azione VARCHAR default '');
procedure AggiungiCampoFormFilro(tipo VARCHAR2 default 'text',value VARCHAR2 default '',  placeholder VARCHAR2 default '');
procedure chiudiFormFiltro;

--Procedure titoli e testi
procedure aggiungiIntestazione(testo VARCHAR2 default 'Intestazione', dimensione VARCHAR2 default 'h1', class VARCHAR2 default '');
procedure aggiungiParagrafo(testo VARCHAR2 default 'testo', class VARCHAR2 default '');


--Procedure per menu a tendina
procedure menuIcon;
procedure dropDownMenu;
end gui;