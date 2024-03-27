create or replace PACKAGE gui as

TYPE StringArray IS VARRAY(15) OF VARCHAR2(30); -- Tipo array di stringhe 

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default 0, ruolo VARCHAR2 default 'Cl');

procedure Reindirizza(indirizzo varchar2);

procedure ApriBody(idSessione int default 0, ruolo VARCHAR2);

procedure ChiudiBody;

procedure Bottone(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '', ident varchar2 default '', classe varchar2 default '');

procedure ApriDiv(ident varchar2 default '', classe varchar2 default '');

procedure ChiudiDiv;

procedure TopBar(saldo varchar2 default null, ruolo VARCHAR2);

procedure AggiungiPopup(successo boolean, testo VARCHAR2 default 'Errore!');

-- Procedure per Tabella
procedure ApriTabella;
PROCEDURE ApriHeaderTabella;
procedure AggiungiHeadersTabella(elementi StringArray default emptyArray);
procedure AggiungiHeaderTabella(elemento VARCHAR2 default '');
procedure ChiudiHeaderTabella;
procedure ApriBodyTabella;
procedure AggiungiRigaTabella;
procedure ChiudiRigaTabella;
procedure AggiungiElementoTabella(elemento VARCHAR2 default '');
procedure AggiungiPulsanteInTabella(collegamento1 VARCHAR2 default '', collegamento2 VARCHAR2 default '');
procedure ChiudiTabella;


--procedure per Filtro Tabella
procedure ApriFormFiltro(azione VARCHAR default '');
procedure AggiungiCampoFormFiltro(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '',  placeholder VARCHAR2 default '');
procedure chiudiFormFiltro;
procedure ApriSelectFormFiltro(nome varchar2);
procedure AggiungiOpzioneSelect(value VARCHAR2, selected BOOLEAN, testo VARCHAR2 default '');
procedure ChiudiSelectFormFiltro;

--Procedure titoli e testi
procedure aggiungiIntestazione(testo VARCHAR2 default 'Intestazione', dimensione VARCHAR2 default 'h1', class VARCHAR2 default '');
procedure aggiungiParagrafo(testo VARCHAR2 default 'testo', class VARCHAR2 default '');

--Dropdown con selezione multipla
procedure aggiungiDropdown(testo VARCHAR2 default 'testo', opzioni stringArray default null);

--Footer
procedure Footer;

--Form

procedure aggiungiForm(classe VARCHAR2 default '', name VARCHAR2 default '', url VARCHAR2 default '');
procedure creaForm (titolo VARCHAR2 default '', url VARCHAR2 default '');
procedure AggiungiCampoForm(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '',  placeholder VARCHAR2 default '', required BOOLEAN default false);
procedure AggiungiLabel(target VARCHAR2, testo VARCHAR2);
PROCEDURE chiudiForm;


end gui;