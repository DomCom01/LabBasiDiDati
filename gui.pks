SET DEFINE OFF;

create or replace PACKAGE gui as

type StringArray is table of varchar2(30) not null;

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione VARCHAR default '-1',  scriptJS VARCHAR2 default '');

procedure Reindirizza(indirizzo varchar2);
procedure aCapo(volte number default 1);
procedure ApriBody(idSessione varchar2);

procedure ChiudiPagina(scriptJS VARCHAR2 default '');

procedure BottoneTopBar(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '');

procedure BottonePrimario(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '');


procedure ApriDiv(ident varchar2 default '', classe varchar2 default '', onclick varchar2 default '');

procedure ChiudiDiv;

procedure TopBar(id_user int, username VARCHAR2, ruolo varchar2);

procedure AggiungiPopup(successo boolean, testo VARCHAR2 default 'Errore!', indirizzo varchar2 default '');

-- Procedure per Tabella
/*ApriTabella ora contiene apri header, aggiungi header, chiudi header e apri body*/
procedure ApriTabella(elementi StringArray default emptyArray);
procedure AggiungiRigaTabella;
procedure ChiudiRigaTabella;
procedure AggiungiElementoTabella(elemento VARCHAR2 default '');

/*
Per aggiungere i pulsanti seguire questo pattern qui:
*/
procedure apriElementoPulsanti;
procedure AggiungiPulsanteCancellazione(proceduraEliminazione VARCHAR2 default '');
procedure AggiungiPulsanteModifica(collegamento1 VARCHAR2 default '');
/*Cambiare nome parametro*/
procedure AggiungiPulsanteGenerale(proceduraEliminazione VARCHAR2 DEFAULT '', testo VARCHAR2);
procedure chiudiElementoPulsanti;

procedure ChiudiTabella;


--procedure per Filtro Tabella
procedure ApriFormFiltro(azione VARCHAR default '');
procedure AggiungiCampoFormFiltro(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '',  placeholder VARCHAR2 default '', required BOOLEAN default false, classe VARCHAR2 default '', ident VARCHAR2 default '', pattern VARCHAR2 default '', minimo VARCHAR2 default '', massimo VARCHAR2 default '');
/* Per aggiungere una nuova riga al form basta chiamare AggiungiRigaTabella */
procedure chiudiFormFiltro;
procedure ApriSelectFormFiltro(nome varchar2, placeholder VARCHAR2);
procedure AggiungiOpzioneSelect(value VARCHAR2, selected BOOLEAN, testo VARCHAR2 default '');
procedure ChiudiSelectFormFiltro;

--Procedure titoli e testi
procedure aggiungiIntestazione(testo VARCHAR2 default 'Intestazione', dimensione VARCHAR2 default 'h1', class VARCHAR2 default '');
procedure aggiungiParagrafo(testo VARCHAR2 default 'testo', class VARCHAR2 default '');

--Dropdown con selezione multipla
procedure aggiungiDropdown(testo VARCHAR2 default 'testo', opzioni stringArray default null);
procedure aggiungiDropdownFormFiltro(testo VARCHAR2 default 'testo', placeholder VARCHAR2 default 'testo', ids stringArray default emptyArray ,names stringArray default emptyArray, hiddenParameter varchar2 default '');
--Footer
procedure Footer;

--Form

procedure aggiungiForm(classe VARCHAR2 default '', name VARCHAR2 default '', url VARCHAR2 default '');
procedure AggiungiInput(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '', placeholder VARCHAR2 default '', 
	required BOOLEAN default false, classe VARCHAR2 default '', ident VARCHAR2 default '', pattern VARCHAR2 default '', minimo VARCHAR2 default '', 
	massimo VARCHAR2 default '', readonly boolean default False, selected boolean default False, step varchar default null);
procedure AggiungiLabel(target VARCHAR2, testo VARCHAR2);
procedure aggiungiIcona (classe VARCHAR2 default ''); 
procedure aggiungiCampoForm (tipo VARCHAR2 default 'text', classeIcona VARCHAR2 default '', nome VARCHAR2, placeholder VARCHAR2 default '');
procedure aggiungiSelezioneSingola(elementi StringArray, valoreEffettivo StringArray default null, titolo varchar2 default '', ident varchar2);
procedure aggiungiSelezioneMultipla(testo VARCHAR2 default 'testo', placeholder VARCHAR2 default 'testo', ids stringArray default emptyArray ,names stringArray default emptyArray, hiddenParameter varchar2 default '');

-------------------
procedure AggiungiCampoFormHidden(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '');
procedure aggiungiBottoneSubmit (value VARCHAR2 default ''); 
PROCEDURE aggiungiGruppoInput(classe varchar2 default 'form-row'); 
procedure chiudiGruppoInput; 
PROCEDURE chiudiForm;
-------------------



PROCEDURE AggiungiBottoneTabella(testo VARCHAR2 DEFAULT '', classe VARCHAR2 DEFAULT 'button-tab', url VARCHAR2 DEFAULT '');
PROCEDURE BottoneAggiungi(testo VARCHAR2 DEFAULT '', classe VARCHAR2 DEFAULT 'button-add', url VARCHAR2);

---------------------- Homepage

procedure HomePage(p_success varchar2 default ' ', cEmail VARCHAR2 default null, p_password varchar2 default null, tipo_utente varchar2 default null, idSessione varchar default '-1');
procedure LogOut(idUser int, ruolo varchar2);

end gui;