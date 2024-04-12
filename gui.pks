SET DEFINE OFF;
create or replace PACKAGE gui as

TYPE StringArray IS VARRAY(15) OF VARCHAR2(30); -- Tipo array di stringhe 

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default -1);

procedure Reindirizza(indirizzo varchar2);

PROCEDURE aCapo;

procedure ApriBody(idSessione int, ruolo VARCHAR);

procedure ChiudiPagina;

procedure BottoneTopBar(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '');

procedure BottonePrimario(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '');

procedure ApriDiv(ident varchar2 default '', classe varchar2 default '');

procedure ChiudiDiv;

procedure TopBar(saldo varchar2 default null, ruolo VARCHAR2);

procedure AggiungiPopup(successo boolean, testo VARCHAR2 default 'Errore!');

-- Procedure per Tabella
/*ApriTabella ora contiene apri header, aggiungi header, chiudi header e apri body*/
procedure ApriTabella(elementi StringArray default emptyArray);
procedure AggiungiRigaTabella;
procedure ChiudiRigaTabella;
procedure AggiungiElementoTabella(elemento VARCHAR2 default '');
procedure AggiungiPulsanteCancellazione(proceduraEliminazione VARCHAR2 default '');
procedure AggiungiPulsanteModifica(collegamento1 VARCHAR2 default '');
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
procedure aggiungiDropdownFormFiltro(testo VARCHAR2 default 'testo', placeholder VARCHAR2 default 'testo', nomiParametri stringArray default null, opzioni stringArray default null);

--Footer
procedure Footer;

--Form

	procedure aggiungiform (
		classe varchar2 default '',
		name   varchar2 default '',
		url    varchar2 default ''
	);

	procedure aggiungiinput (
		tipo        varchar2 default 'text',
		nome        varchar2,
		value       varchar2 default '',
		placeholder varchar2 default '',
		required    boolean default false,
		readonly    boolean default false,
		classe      varchar2 default '',
		ident       varchar2 default '',
		pattern     varchar2 default '',
		minimo      varchar2 default '',
		massimo     varchar2 default ''
	);

	procedure aggiungilabel (
		target varchar2,
		testo  varchar2
	);

	procedure aggiungiicona (
		classe varchar2 default ''
	);

	procedure aggiungicampoform (
		tipo        varchar2 default 'text',
		classeicona varchar2 default '',
		nome        varchar2,
		required    BOOLEAN default true,
		ident VARCHAR2 default '',  
		placeholder varchar2 default ''
	);

------------------- Aggiunto per fare delle prove per le procedure nel gruppo operazioni
procedure aggiungiFormHiddenRigaTabella(azione varchar2 default '');
procedure chiudiFormHiddenRigaTabella;
-------------------
procedure AggiungiCampoFormHidden(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '');
procedure aggiungiRigaForm;
procedure chiudiRigaForm;
procedure aggiungiBottoneSubmit (nome VARCHAR2, value VARCHAR2 default ''); 
PROCEDURE aggiungiGruppoInput; 
procedure chiudiGruppoInput; 
PROCEDURE chiudiForm;

procedure cancella;


procedure AggiungiBottoneTabella(testo VARCHAR2 default '', classe VARCHAR2 default 'button-tab', url VARCHAR2);
PROCEDURE BottoneAggiungi(testo VARCHAR2 DEFAULT '', classe VARCHAR2 DEFAULT 'button-add', url VARCHAR2);

end gui;