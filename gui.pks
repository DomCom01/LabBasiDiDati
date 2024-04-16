SET DEFINE OFF;
SET DEFINE OFF;
create or replace PACKAGE gui as

type StringArray is table of varchar2(30) not null;

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default -1,  scriptJS VARCHAR2 default '');

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
procedure AggiungiPulsanteGenerale(proceduraEliminazione VARCHAR2 DEFAULT '', testo VARCHAR2);
procedure chiudiElementoPulsanti;

procedure ChiudiTabella;


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
procedure aggiungiCampoForm (tipo VARCHAR2 default 'text', classeIcona VARCHAR2 default '', nome VARCHAR2, placeholder VARCHAR2 default '');
procedure aggiungiSelezioneSingola(elementi StringArray, valoreEffettivo StringArray default null, titolo varchar2 default '', ident varchar2);
procedure aggiungiSelezioneMultipla(testo VARCHAR2 default 'testo', placeholder VARCHAR2 default 'testo', ids stringArray default emptyArray ,names stringArray default emptyArray, hiddenParameter varchar2 default '');

-------------------
procedure AggiungiCampoFormHidden(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '');
procedure aggiungiBottoneSubmit (value VARCHAR2 default ''); 
PROCEDURE aggiungiGruppoInput; 
procedure chiudiGruppoInput; 
PROCEDURE chiudiForm;
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

procedure HomePage(p_success varchar2 default ' ', cEmail VARCHAR2 default null, p_password varchar2 default null, tipo_utente varchar2 default null, idSessione varchar default '-1');
procedure LogOut(idUser int, ruolo varchar2);

end gui;