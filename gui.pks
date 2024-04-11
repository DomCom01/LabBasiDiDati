SET DEFINE OFF;
create or replace PACKAGE gui as

type StringArray is table of varchar2(30) not null;

emptyArray StringArray;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default 0, ruolo VARCHAR2 default 'Cl');

procedure Reindirizza(indirizzo varchar2);
procedure aCapo(volte number default 1);
procedure ApriBody(idSessione int default 0, ruolo VARCHAR2);

procedure ChiudiPagina;

procedure BottoneTopBar(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '');

procedure BottonePrimario(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '');


procedure ApriDiv(ident varchar2 default '', classe varchar2 default '');

procedure ChiudiDiv;

procedure TopBar(saldo varchar2 default null, ruolo VARCHAR2);

procedure AggiungiPopup(successo boolean, testo VARCHAR2 default 'Errore!', indirizzo varchar2 default '');

-- Procedure per Tabella
/*ApriTabella ora contiene apri header, aggiungi header, chiudi header e apri body*/
procedure ApriTabella(elementi StringArray default emptyArray);
procedure AggiungiRigaTabella;
procedure ChiudiRigaTabella;
procedure AggiungiElementoTabella(elemento VARCHAR2 default '');
procedure AggiungiPulsanteCancellazione(proceduraEliminazione VARCHAR2 default '');
procedure AggiungiPulsanteModifica(collegamento1 VARCHAR2 default '');
procedure AggiungiPulsanteGenerale(
    proceduraEliminazione VARCHAR2 DEFAULT '',
	testo VARCHAR2
);
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

procedure aggiungiForm(classe VARCHAR2 default '', name VARCHAR2 default '', url VARCHAR2 default '');
procedure AggiungiInput(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '', placeholder VARCHAR2 default '', 
	required BOOLEAN default false, classe VARCHAR2 default '', ident VARCHAR2 default '', pattern VARCHAR2 default '', minimo VARCHAR2 default '', 
	massimo VARCHAR2 default '', readonly boolean default False);
procedure AggiungiLabel(target VARCHAR2, testo VARCHAR2);
procedure aggiungiIcona (classe VARCHAR2 default ''); 
procedure aggiungiCampoForm (tipo VARCHAR2 default 'text', classeIcona VARCHAR2 default '', nome VARCHAR2, placeholder VARCHAR2 default '');
procedure aggiungiSelezioneSingola(elementi StringArray, valoreEffettivo StringArray default null, titolo varchar2 default '', ident varchar2);
procedure aggiungiSelezioneMultipla(elementi StringArray, titolo varchar2 default '', ident varchar2);
------------------- Aggiunto per fare delle prove per le procedure nel gruppo operazioni
procedure aggiungiFormHiddenRigaTabella(azione varchar2 default '');
procedure chiudiFormHiddenRigaTabella;
-------------------
procedure AggiungiCampoFormHidden(nome VARCHAR2, value VARCHAR2 default '');
procedure aggiungiRigaForm;
procedure chiudiRigaForm;
procedure aggiungiBottoneSubmit (nome VARCHAR2, value VARCHAR2 default ''); 
PROCEDURE aggiungiGruppoInput; 
procedure chiudiGruppoInput; 
PROCEDURE chiudiForm;

procedure cancella(linktest varchar2) ;



procedure AggiungiBottoneTabella(testo VARCHAR2 default '', classe VARCHAR2 default 'button-tab');
procedure BottoneAggiungi(testo VARCHAR2 default '', classe VARCHAR2 default 'button-add', indirizzo varchar2);

end gui;
