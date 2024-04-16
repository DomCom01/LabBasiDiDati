   SET DEFINE OFF;
SET DEFINE OFF;

create or replace PACKAGE gui as

type StringArray is table of varchar2(100) not null;

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione VARCHAR default '-1',  scriptJS VARCHAR2 default '');

	procedure reindirizza (
		indirizzo varchar2
	);
	procedure acapo (
		volte number default 1
	);
	procedure apribody (
		idsessione varchar2
	);

	procedure chiudipagina (
		scriptjs varchar2 default ''
	);

	procedure bottonetopbar (
		testo  varchar2 default '',
		nome   varchar2 default '',
		valore varchar2 default ''
	);

	procedure bottoneprimario (
		testo  varchar2 default '',
		nome   varchar2 default '',
		valore varchar2 default ''
	);


	procedure apridiv (
		ident   varchar2 default '',
		classe  varchar2 default '',
		onclick varchar2 default ''
	);

	procedure chiudidiv;

	procedure topbar (
		id_user  int,
		username varchar2,
		ruolo    varchar2
	);

	procedure aggiungipopup (
		successo  boolean,
		testo     varchar2 default 'Errore!',
		indirizzo varchar2 default ''
	);

-- Procedure per Tabella
/*ApriTabella ora contiene apri header, aggiungi header, chiudi header e apri body*/
	procedure apritabella (
		elementi stringarray default emptyarray
	);
	procedure aggiungirigatabella;
	procedure chiudirigatabella;
	procedure aggiungielementotabella (
		elemento varchar2 default ''
	);

/*
Per aggiungere i pulsanti seguire questo pattern qui:
	ApriElementoPulsanti
		aggiungiPulsante
		aggiungiPulsante
	ChiudiElementoPulsanti
*/
procedure apriElementoPulsanti;
procedure AggiungiPulsanteCancellazione(collegamento VARCHAR2 default '');
procedure AggiungiPulsanteModifica(collegamento VARCHAR2 default '');
procedure AggiungiPulsanteGenerale(collegamento VARCHAR2 DEFAULT '', testo VARCHAR2);
procedure chiudiElementoPulsanti;

	procedure chiuditabella;


--procedure per Filtro Tabella
	procedure apriformfiltro (
		azione varchar default ''
	);
	procedure aggiungicampoformfiltro (
		tipo        varchar2 default 'text',
		nome        varchar2 default null,
		value       varchar2 default '',
		placeholder varchar2 default '',
		required    boolean default false,
		classe      varchar2 default '',
		ident       varchar2 default '',
		pattern     varchar2 default '',
		minimo      varchar2 default '',
		massimo     varchar2 default ''
	);
/* Per aggiungere una nuova riga al form basta chiamare AggiungiRigaTabella */
	procedure chiudiformfiltro;
	procedure apriselectformfiltro (
		nome        varchar2,
		placeholder varchar2
	);
	procedure aggiungiopzioneselect (
		value    varchar2,
		selected boolean,
		testo    varchar2 default ''
	);
	procedure chiudiselectformfiltro;

--Procedure titoli e testi
	procedure aggiungiintestazione (
		testo      varchar2 default 'Intestazione',
		dimensione varchar2 default 'h1',
		class      varchar2 default ''
	);
	procedure aggiungiparagrafo (
		testo varchar2 default 'testo',
		class varchar2 default ''
	);

--Dropdown con selezione multipla
	procedure aggiungidropdown (
		testo   varchar2 default 'testo',
		opzioni stringarray default null
	);
	procedure aggiungidropdownformfiltro (
		testo           varchar2 default 'testo',
		placeholder     varchar2 default 'testo',
		ids             stringarray default emptyarray,
		names           stringarray default emptyarray,
		hiddenparameter varchar2 default ''
	);
--Footer
	procedure footer;

--Form

procedure aggiungiForm(classe VARCHAR2 default '', name VARCHAR2 default '', url VARCHAR2 default '');
procedure AggiungiInput(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '', placeholder VARCHAR2 default '', 
	required BOOLEAN default false, classe VARCHAR2 default '', ident VARCHAR2 default '', pattern VARCHAR2 default '', minimo VARCHAR2 default '', 
	massimo VARCHAR2 default '', readonly boolean default False, selected boolean default False, step varchar default null);
procedure AggiungiLabel(target VARCHAR2, testo VARCHAR2);
procedure aggiungiIcona (classe VARCHAR2 default ''); 

PROCEDURE aggiungiGruppoInput; --Delimita i campi di input del form
procedure chiudiGruppoInput; 

procedure aggiungiCampoForm (tipo VARCHAR2 default 'text', classeIcona VARCHAR2 default '', nome VARCHAR2,required BOOLEAN default true, ident VARCHAR2 default '', placeholder VARCHAR2 default '');
procedure aggiungiSelezioneSingola(elementi StringArray, valoreEffettivo StringArray default null, titolo varchar2 default '', ident varchar2);
procedure aggiungiSelezioneMultipla(testo VARCHAR2 default 'testo', placeholder VARCHAR2 default 'testo', ids stringArray default emptyArray ,names stringArray default emptyArray, hiddenParameter varchar2 default '');

-------------------
	procedure aggiungicampoformhidden (
		tipo  varchar2 default 'text',
		nome  varchar2,
		value varchar2 default ''
	);
	procedure aggiungibottonesubmit (
		value varchar2 default ''
	);
	
	procedure chiudiform;
-------------------



	procedure aggiungibottonetabella (
		testo  varchar2 default '',
		classe varchar2 default 'button-tab',
		url    varchar2 default ''
	);
	procedure bottoneaggiungi (
		testo  varchar2 default '',
		classe varchar2 default 'button-add',
		url    varchar2
	);

---------------------- Homepage

	procedure homepage (
		p_success   varchar2 default ' ',
		cemail      varchar2 default null,
		p_password  varchar2 default null,
		tipo_utente varchar2 default null,
		idsessione  varchar default '-1'
	);
	procedure logout (
		iduser int,
		ruolo  varchar2
	);

end gui;
