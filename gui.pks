
SET DEFINE OFF;
create or replace PACKAGE gui as

type StringArray is table of varchar2(30) not null;

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione varchar default '-1',  scriptJS VARCHAR2 default '');

procedure Reindirizza(indirizzo varchar2);
procedure aCapo(volte number default 1);
procedure ApriBody(idSessione varchar2);

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

procedure TopBar(id_user int, username VARCHAR2, ruolo varchar2);

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
	procedure aggiungipulsantecancellazione (
		proceduraeliminazione varchar2 default ''
	);
	procedure aggiungipulsantemodifica (
		collegamento1 varchar2 default ''
	);
	procedure aggiungipulsantegenerale (
		proceduraeliminazione varchar2 default '',
		testo                 varchar2
	);
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
        classe      varchar2 default '',
        ident       varchar2 default '',
        pattern     varchar2 default '',
        minimo      varchar2 default '',
        massimo     varchar2 default '',
        readonly    boolean default false,
        selected    boolean default false
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
		required BOOLEAN default true,
		ident VARCHAR2 default '',
        placeholder varchar2 default ''
    );
    procedure aggiungiselezionesingola (
        elementi        stringarray,
        valoreeffettivo stringarray default null,
        titolo          varchar2 default '',
        ident           varchar2
    );
    procedure aggiungiselezionemultipla (
        elementi stringarray,
        titolo   varchar2 default '',
        ident    varchar2
    );
------------------- Aggiunto per fare delle prove per le procedure nel gruppo operazioni
	procedure aggiungiformhiddenrigatabella (
		azione varchar2 default ''
	);
	procedure chiudiformhiddenrigatabella;
-------------------
	procedure aggiungicampoformhidden (
		tipo  varchar2 default 'text',
		nome  varchar2,
		value varchar2 default ''
	);

	procedure aggiungirigaform;

	procedure chiudirigaform;

    procedure aggiungibottonesubmit (
        ident varchar2 default null,
        value varchar2 default ''
    );
    procedure aggiungigruppoinput;
    procedure chiudigruppoinput;
    procedure chiudiform;
-------------------

	procedure cancella (
		linktest varchar2
	);



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

procedure HomePage(p_success varchar2 default ' ', cEmail VARCHAR2 default null, p_password varchar2 default null, tipo_utente varchar2 default null, idSessione varchar default '-1');
procedure LogOut(idUser int, ruolo varchar2);

end gui;