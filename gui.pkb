create or replace PACKAGE BODY gui as

procedure Reindirizza(indirizzo varchar2) is
begin
	htp.prn('<head><meta http-equiv="refresh" content="0;url=' || indirizzo || '"></head>');
end Reindirizza;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default -1) is
begin
	htp.htmlOpen;
	htp.headOpen;
	htp.title(titolo);
	htp.print('
  		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  	'); 
	htp.print('<style> ' || costanti.stile || '</style>');
	htp.print('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
'); /*FONTAwesome*/
	htp.print('<script type="text/javascript">' || costanti.scriptjs || '</script>'); -- Aggiunto script di base
 	htp.headClose; 
	gui.ApriBody(idSessione, SessionHandler.getRuolo(idSessione));

end ApriPagina;

procedure ApriBody(idSessione int, ruolo VARCHAR) is
begin

	if idSessione = -1 then --Sessione ospite
		--Apri topbar ? con quali bottoni
		--Carica form di logIn
		gui.aCapo;
	end if;


	htp.print('<body>');
	if ruolo = 'Cliente' then
		gui.TopBar('0', ruolo); --Modificare if sotto per aggiungere TopBar con saldo e menu profilo se utente registrato, altrimenti niente
	else 
		gui.TopBar(null, ruolo);
	end if;
	gui.ApriDiv('', 'container');
	gui.ApriDiv('', 'contentContainer');
	/*if (idSessione = 0) then  -- Sessione di tipo 'Ospite'
		modGUI.InserisciLoginERegistrati;
		modGUI.ChiudiDiv;
	else
		-- Fare una query alla tabella Sessioni per aggiungere l'username dell'utente in alto a destra
		modGUI.InserisciLogout(idSessione);
		modGUI.ChiudiDiv;
	end if;*/

end ApriBody;
procedure ChiudiPagina is
begin
	htp.prn('</div>'); /*container*/
	htp.prn('</div>'); /*content-container*/
	gui.Footer;
	htp.print('</body>');

end ChiudiPagina;

procedure indirizzo(indirizzo VARCHAR2 default '') is
begin
	htp.prn('<a href="'|| indirizzo ||'">');
end indirizzo;

procedure chiudiIndirizzo is
begin
	htp.prn('</a>');
end chiudiIndirizzo;

procedure BottoneTopBar(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '') is
begin
	htp.prn('<button type="submit" ');
	
	if ((nome != '' and nome is not null) and (valore != '' and valore is not null)) then
		htp.prn('name="' || nome || '"  value="' || valore || '" ');
	end if;
	
	htp.prn(' class="button-48">');
	htp.prn('<span class="text">'); 
	htp.prn(testo);
	htp.prn('</span>');
	htp.prn('</button>');

end BottoneTopBar;

procedure BottonePrimario(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '') is
begin
	htp.prn('<button type="submit" ');
	
	if ((nome != '' and nome is not null) and (valore != '' and valore is not null)) then
		htp.prn('name="' || nome || '"  value="' || valore || '" ');
	end if;
	
	htp.prn(' class="bottone">');
	htp.prn('<span class="text">'); 
	htp.prn(testo);
	htp.prn('</span>');
	htp.prn('</button>');

end BottonePrimario;

procedure ApriDiv(ident varchar2 default '', classe varchar2 default '') is
begin
	htp.print('<div');
  	if ident is not null then
    	htp.print(' id="' || ident || '"');
  	end if;
  	if classe is not null then
    	htp.print(' class="' || classe || '"');
 	 end if;
 	htp.print('>');

end ApriDiv;

procedure ChiudiDiv is
begin
	htp.print('</div>');

end ChiudiDiv;

procedure TopBar(saldo varchar2 default null, ruolo VARCHAR2) is
BEGIN
	gui.ApriDiv(ident => 'top-bar');
	/*if saldo is null then
		gui.Bottone(testo => 'Saldo: 0.00 €', classe => 'bottone');
	else
		gui.Bottone(testo => 'Saldo: ' || saldo || '€', classe => 'bottone');
	end if;*/
	gui.APRIDIV(ident => 'bottoneSinistra');
	CASE ruolo

    	when 'Cliente' then --Cliente 

			gui.BottoneTopBar(testo => 'Clienti'); 
			gui.BottoneTopBar(testo => 'Prenotazioni'); 

    	when 'Autista' THEN --Autista

			gui.BottoneTopBar(testo => 'Prenotazioni'); 
			gui.BottoneTopBar(testo => 'Taxi'); 
			gui.BottoneTopBar(testo => 'Turni');

    	when 'Responsabile' then --Autista Referente

			gui.BottoneTopBar(testo => 'Prenotazioni'); 
			gui.BottoneTopBar(testo => 'Taxi'); 
			gui.BottoneTopBar(testo => 'Turni');

    	when 'Operatore' then --Operatore

			gui.BottoneTopBar(testo => 'Prenotazioni');  
			gui.BottoneTopBar(testo => 'Turni');

    	when 'Manager' then --Manager

			gui.BottoneTopBar(testo => 'Clienti'); 
			gui.BottoneTopBar(testo => 'Prenotazioni'); 
			gui.BottoneTopBar(testo => 'Taxi'); 
			gui.BottoneTopBar(testo => 'Turni'); 

      	when 'Contabile' then --Contabile

			gui.BottoneTopBar(testo => 'Taxi'); 

   	END CASE;
	
	gui.CHIUDIDIV;
	
	gui.APRIDIV(classe=> 'bottoniDestra');
	if saldo is not null then
		gui.BottonePrimario(testo => 'Saldo: ' || saldo || '€');
	end if;
	if ruolo is null then
		gui.BottonePrimario(testo => 'Login');
	else 
		gui.BottonePrimario(testo => 'Logout'); 
	end if;
	gui.CHIUDIDIV;

	gui.ChiudiDiv();
end TopBar;


-- Procedura Tabella senza filtro provvisoria
procedure ApriTabella(elementi StringArray default emptyArray) is
begin
	htp.prn('<table class="tab"> ');
	htp.prn('<thead>');
	htp.prn('<tr>');
	for i in 1..elementi.count loop
		htp.prn('<th>'|| elementi(i) ||'</th>');
	end loop;
	htp.prn('</thead>');
	htp.prn('<tbody>');
end ApriTabella;

procedure ChiudiTabella IS
BEGIN
	htp.prn('</tbody>');
	htp.prn('</table>');
end ChiudiTabella;

procedure AggiungiRigaTabella IS
BEGIN
	htp.prn('<tr>');
end AggiungiRigaTabella;

procedure ChiudiRigaTabella IS
BEGIN
	htp.prn('</tr>');
end ChiudiRigaTabella;

procedure AggiungiPulsanteCancellazione(proceduraEliminazione VARCHAR2 default '') IS
begin
	htp.prn('<td><button onclick="mostraConferma(this.parentNode.parentNode)">
	<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
    <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16l-1.58 14.22A2 2 0 0 1 16.432 22H7.568a2 2 0 0 1-1.988-1.78zm3.345-2.853A2 2 0 0 1 9.154 2h5.692a2 2 0 0 1 1.81 1.147L18 6H6zM2 6h20m-12 5v5m4-5v5"/>
    </svg>
	</button></td>');
end AggiungiPulsanteCancellazione;

procedure cancella IS
BEGIN
	gui.AggiungiPopup(True, 'Ciao');
end cancella;

procedure AggiungiPulsanteModifica(collegamento1 VARCHAR2 default '') IS
BEGIN
	htp.prn('<td><a href="'||collegamento1||'" target="_blank">
		<button>
		<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" fill-opacity="0" d="M20 7L17 4L15 6L18 9L20 7Z"><animate fill="freeze" attributeName="fill-opacity" begin="1.2s" dur="0.15s" values="0;0.3"/></path><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="20" stroke-dashoffset="20" d="M3 21H21"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.3s" values="20;0"/></path><path stroke-dasharray="44" stroke-dashoffset="44" d="M7 17V13L17 3L21 7L11 17H7"><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.4s" dur="0.6s" values="44;0"/></path><path stroke-dasharray="8" stroke-dashoffset="8" d="M14 6L18 10"><animate fill="freeze" attributeName="stroke-dashoffset" begin="1s" dur="0.2s" values="8;0"/></path></g></svg>
		</button></a>');
	htp.prn('</td>');
END AggiungiPulsanteModifica;

procedure AggiungiElementoTabella(elemento VARCHAR2 default '') IS
BEGIN
	htp.prn('<td>'|| elemento || '</td>');
end AggiungiElementoTabella;


procedure ApriFormFiltro(azione VARCHAR default '') IS
begin
	htp.prn('<form action="'|| azione ||'" method="get">
            	<table class="inputTAB">');
end ApriFormFiltro;

procedure AggiungiCampoFormFiltro(tipo VARCHAR2 default 'text', nome varchar2, value VARCHAR2 default '',  placeholder VARCHAR2 default '', id VARCHAR2 default '') IS
begin
	if(tipo = 'submit') then
	
		htp.prn('<td>
				<div class="formField">
					<label class="hidden" id="'||nome||'">_</label>
					<button class="FilterButton" name="'||nome||'" value="'||value||'">'||placeholder||'</button>
				</div>
			</td>');
	else 
		htp.prn('<td>
			<div class="formField">
				<label  id="'||nome||'">'||placeholder||'</label>
				<input class="filterInput" type="'||tipo||'" name="'|| nome ||'" value="'||value||'">
			</div>
		</td>');
	end if;
end AggiungiCampoFormFiltro;

procedure AggiungiCampoFormHidden(tipo VARCHAR2 default 'text', nome VARCHAR2, value VARCHAR2 default '') is
BEGIN
	htp.prn('<input hidden type="'||tipo||'" name="'|| nome ||'" value="'||value||'">');
end AggiungiCampoFormHidden;

procedure ApriSelectFormFiltro(nome varchar2, placeholder VARCHAR2) IS
begin
	htp.prn('<td> <div class="formField">
				 <label id="'||nome||'">'||placeholder||'</label>
				 <select name="'|| nome ||'"> ');
end ApriSelectFormFiltro;

procedure AggiungiOpzioneSelect(value VARCHAR2, selected BOOLEAN, testo VARCHAR2 default '') as
BEGIN
	if selected then
		htp.prn('<option value="'|| value ||'" selected >' || testo ||' </option>');
	else
		htp.prn('<option value="'|| value ||'">' || testo ||' </option>');
	end if;
END AggiungiOpzioneSelect;

procedure ChiudiSelectFormFiltro IS
begin
	htp.prn(' </select> </div> </td> ');
end ChiudiSelectFormFiltro;

procedure chiudiFormFiltro IS
begin
	htp.prn('</table> </form>');
end chiudiFormFiltro;

procedure aggiungiDropdownFormFiltro(testo VARCHAR2 default 'testo', placeholder VARCHAR2 default 'testo', nomiParametri stringArray default null ,opzioni stringArray default null) is 
begin
	htp.prn('<td>
			<div class="formField">');
	if placeholder is not null then
		htp.prn('<label >'||placeholder||'</label>');
	else htp.prn('<label class="hidden" >_</label>');
	end if;
	
	gui.apriDiv(classe => 'multiSelect');
		htp.prn('<div class="multiSelectBtn" onclick="apriMultiSelect()">');
			htp.prn('<span class="text">'|| testo ||'</span>');
			htp.prn('<span class="arrow"></span>');
		htp.prn('</div>');
		gui.apriDiv(ident => 'multiSelect-content', classe => 'multiSelect-content');
		for i in 1..opzioni.count loop
			gui.apriDiv(ident => 'option');
				htp.prn('<input type="checkbox" name="'|| nomiParametri(i) ||'" />');
				htp.prn('<span>'|| opzioni(i) ||'</span>');
			gui.chiudiDiv();
		end loop;
		gui.chiudiDiv();
	gui.chiudiDiv();
				
	htp.prn('</div> </td>');
end aggiungiDropdownFormFiltro;

procedure aggiungiIntestazione(testo VARCHAR2 default 'Intestazione', dimensione VARCHAR2 default 'h1', class VARCHAR2 default '') is
begin
	htp.prn('<'||dimensione||' class='||class||' >'||testo||'</'||dimensione||'>');
end aggiungiIntestazione;

procedure aggiungiParagrafo(testo VARCHAR2 default 'testo', class VARCHAR2 default '') is
begin
	htp.prn('<p class='||class||' >'||testo||'</p>');
end aggiungiParagrafo;

procedure aggiungiDropdown(testo VARCHAR2 default 'testo', opzioni stringArray default null) is
BEGIN
	gui.apriDiv(classe => 'dropdown');
		htp.prn('<button class="dropbtn" onclick="apriMenu()">');
			htp.prn('<span class="text">'|| testo ||'</span>');
			htp.prn('<span class="arrow"></span>');
		htp.prn('</button>');
		gui.apriDiv(ident => 'dropdown-content', classe => 'dropdown-content');
		for i in 1..opzioni.count loop
			gui.apriDiv(ident => 'option');
				htp.prn('<input type="checkbox" id="'|| opzioni(i) ||'" />');
				htp.prn('<label for="'|| opzioni(i) ||'">'|| opzioni(i) ||'</label>');
			gui.chiudiDiv();
		end loop;
		gui.chiudiDiv();
	gui.chiudiDiv();
END aggiungiDropdown;

-- Procedura per popup di errore/successo
procedure AggiungiPopup(successo boolean, testo VARCHAR2 default 'Errore!') IS
begin

	if successo then 
		htp.prn('<div id=1 class="message-box success">');
			htp.prn('<p>'|| testo ||'</p>');
			htp.prn('<p class="closeIcon" onclick="closeBox(1)">🅧</p>');
		htp.prn('</div>');
	else 
		htp.prn('<div id=1 class="message-box error">');
				htp.prn('<p>'|| testo ||'</p>');
				htp.prn('<p class="closeIcon" onclick="closeBox(1)">🅧</p>');
			htp.prn('</div>');
	end if;
end AggiungiPopup;

procedure Footer is
BEGIN
	gui.APRIDIV(ident => 'footer');
	htp.prn('<footer>');
	gui.APRIDIV(ident => 'bottoneSinistra');
		gui.BottoneTopBar(testo => 'Contattaci'); 
		gui.BottoneTopBar(testo => 'Su di noi'); 
		gui.BottoneTopBar(testo => 'Termini di servizio'); 
		gui.BottoneTopBar(testo => 'Privacy'); 
	gui.CHIUDIDIV;
	htp.prn('</footer>');
	gui.CHIUDIDIV;
END Footer;

/*Form*/

procedure aggiungiForm (classe VARCHAR2 default '', name VARCHAR2 default '', url VARCHAR default '') IS
BEGIN
	htp.prn ('<form method="GET" class="'||classe||'" name="'||name||'" action="'||url||'"">'); 
	gui.APRIDIV(classe => 'form-container'); 
END aggiungiForm;

procedure chiudiForm IS
BEGIN
	gui.CHIUDIDIV; --form-container
	htp.prn ('</form>'); 
END chiudiForm; 

procedure AggiungiInput(tipo VARCHAR2 default 'text', nome VARCHAR2 default '', value VARCHAR2 default '',  placeholder VARCHAR2 default '', required BOOLEAN default false, classe VARCHAR2 default '', ident VARCHAR2 default '') as
BEGIN
	if required then
		htp.prn('<input class="'||classe||'" type="'||tipo||'"id ="'||ident||'" name="'|| nome ||'" placeholder="'||placeholder||'" value="'||value||'" required>');
	else 
		htp.prn('<input class="'||classe||'" type="'||tipo||'"id ="'||ident||'" name="'|| nome ||'" placeholder="'||placeholder||'" value="'||value||'">');
	end if;

end AggiungiInput;

procedure AggiungiLabel(target VARCHAR2, testo VARCHAR2) is
begin
	htp.prn('<label for="'||target||'"">'||testo||' </label>');
end AggiungiLabel;


procedure AggiungiBottoneTabella(testo VARCHAR2 default '', classe VARCHAR2 default 'button-tab') is
BEGIN
	htp.prn('<td><button type="submyt" class="' || classe || '"> '|| testo ||' </button></td>' );
end AggiungiBottoneTabella;

procedure BottoneAggiungi(testo VARCHAR2 default '', classe VARCHAR2 default 'button-add') is
BEGIN
	htp.prn('<div class="button-add-container"><button class="' || classe || '"type="submyt"> '|| testo ||' </button></div>' );
end BottoneAggiungi;

procedure aggiungiIcona (classe VARCHAR2 default '') IS
BEGIN
	htp.prn ('<i class="'||classe||'"></i>'); 
	end aggiungiIcona; 

procedure aggiungiCampoForm (tipo VARCHAR2 default 'text', classeIcona VARCHAR2 default '', nome VARCHAR2, placeholder VARCHAR2 default '') IS
begin

	if tipo = 'text'
	then
		gui.APRIDIV (classe => 'input-group input-group-icon');    

                gui.aggiungiInput (nome => nome, placeholder => placeholder, required => true, classe => '');
                gui.apriDiv (classe => 'input-icon'); 
                    gui.aggiungiIcona(classe => classeIcona); 
                gui.chiudiDiv; 

 	gui.chiudiDiv; 
	else
		gui.APRIDIV (classe => 'input-group input-group-icon');     

                gui.aggiungiInput (tipo => tipo, nome => nome, placeholder => placeholder, required => true, classe => '');
                gui.apriDiv (classe => 'input-icon'); 
                    gui.aggiungiIcona(classe => classeIcona); 
                gui.chiudiDiv; 
 	gui.chiudiDiv; 
	end if;  

end aggiungiCampoForm;	

procedure aggiungiRigaForm is
BEGIN 
	gui.APRIDIV(classe => 'form-row');
	END aggiungiRigaForm; 

procedure chiudiRigaForm is
BEGIN 
	gui.CHIUDIDIV; 
	END chiudiRigaForm; 

procedure aggiungiBottoneSubmit (value VARCHAR2 default '') is
BEGIN 
	gui.APRIDIV(classe => 'form-submit');   
					
                    gui.AGGIUNGIINPUT (tipo => 'submit', value => value);

                gui.CHIUDIDIV;
END aggiungiBottoneSubmit; 

procedure aggiungiGruppoInput is
BEGIN
	gui.APRIDIV (classe => 'input-group');
	END aggiungiGruppoInput; 

procedure chiudiGruppoInput is
BEGIN
	gui.CHIUDIDIV; 
END chiudiGruppoInput; 

------------------ Aggiunto per fare delle prove per le procedure nel gruppo operazioni
procedure aggiungiFormHiddenRigaTabella(azione varchar2 default '') is
begin
	htp.prn('<form action="'||azione||'" > <td>');
end aggiungiFormHiddenRigaTabella;


procedure chiudiFormHiddenRigaTabella is
begin
	htp.prn(' </td> </form>');
end chiudiFormHiddenRigaTabella;

procedure aCapo is
BEGIN
	htp.prn('<br>');
end aCapo;


end gui;