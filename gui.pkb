create or replace PACKAGE BODY gui as

procedure Reindirizza(indirizzo varchar2) is
begin
	htp.prn('<head><meta http-equiv="refresh" content="0;url=' || indirizzo || '"></head>');

end Reindirizza;

procedure ApriPagina(titolo varchar2 default 'Senza titolo', idSessione int default 0) is
begin
	htp.htmlOpen;
	htp.headOpen;
	htp.title(titolo);
	htp.print('
  		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  	'); 
	htp.print('<style> ' || costanti.stile || '</style>');
	/*Aggiunto script apriMenu che gestisce il dropdown*/
	htp.print('<script type="text/javascript">
					function apriMenu() {
						var contenutoMenu = document.getElementById("dropdown-content");
						var freccia = document.querySelector(".dropbtn .arrow");
						var opzioni = contenutoMenu.querySelectorAll(".option");

						if (contenutoMenu.style.display === "none" || contenutoMenu.style.display === "") {
							contenutoMenu.style.display = "block";
							freccia.style.transform = "rotate(0deg)";
							opzioni.forEach(function(opzione) {
								opzione.removeAttribute("hidden");
							});
						} else {
							contenutoMenu.style.display = "none";
							freccia.style.transform = "rotate(-90deg)";
							opzioni.forEach(function(opzione) {
								opzione.setAttribute("hidden", "");
							});
						}
					}
</script>');
 	htp.headClose; 

	gui.ApriBody(idSessione);
	
end ApriPagina;

procedure ApriBody(idSessione int default 0) is
begin
  htp.print('<body>');
  gui.ApriDiv('', 'container');
  gui.TopBar(); --Modificare if sotto per aggiungere TopBar con saldo e menu profilo se utente registrato, altrimenti niente
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

procedure ChiudiBody is
begin
	htp.prn('</div>'); /*container*/
	htp.prn('</div>'); /*content-container*/
	gui.Footer;
	htp.print('</body>');

end ChiudiBody;

procedure Bottone(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '', ident varchar2 default '', classe varchar2 default '', onclick varchar2 default '') is
begin
	htp.prn('<button type="submit" ');
	
	if ((nome != '' and nome is not null) and (valore != '' and valore is not null)) then
		htp.prn('name="' || nome || '"  value="' || valore || '" ');
	end if;
	
	htp.prn('id="' || ident || '" class="' || classe || '" onclick='|| onclick ||'>');
	htp.prn('<span class="text">'); --Span mi serve per mostrare il testo nel bottone della topbar e non sembra darmi problemi con gli altri
	htp.prn(testo);
	htp.prn('</span>');
	htp.prn('</button>');

end Bottone;

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

procedure TopBar(saldo varchar2 default null) is
BEGIN
	gui.ApriDiv(ident => 'top-bar');
	/*if saldo is null then
		gui.Bottone(testo => 'Saldo: 0.00 €', classe => 'bottone');
	else
		gui.Bottone(testo => 'Saldo: ' || saldo || '€', classe => 'bottone');
	end if;*/
		
		gui.APRIDIV(ident => 'bottoneSinistra');
			gui.Bottone(testo => 'Clienti', classe => 'button-48'); 
			gui.Bottone(testo => 'Prenotazioni', classe => 'button-48'); 
			gui.Bottone(testo => 'Taxi', classe => 'button-48'); 
			gui.Bottone(testo => 'Turni', classe => 'button-48'); 
		gui.CHIUDIDIV;

		gui.Bottone(testo => 'Login', classe => 'bottone'); 
	gui.ChiudiDiv();
end TopBar;


-- Procedura Tabella senza filtro provvisoria
procedure ApriTabella is
begin
	htp.prn('<table class="tab"> ');
end ApriTabella;

procedure ApriHeaderTabella IS
BEGIN
	htp.prn('<thead>');
	htp.prn('<tr>');
end ApriHeaderTabella;	

procedure AggiungiHeaderTabella(elemento VARCHAR2 default '') IS
BEGIN
	htp.prn('<th>'|| elemento ||'</th>');
end AggiungiHeaderTabella;

procedure AggiungiHeadersTabella(elementi StringArray default emptyArray) is
begin
	for i in 1..elementi.count loop
		htp.prn('<th>'|| elementi(i) ||'</th>');
	end loop;
end AggiungiHeadersTabella;

procedure ChiudiHeaderTabella IS
BEGIN
	htp.prn('</thead>');
end ChiudiHeaderTabella;

procedure ApriBodyTabella IS
BEGIN
	htp.prn('<tbody>');
end ApriBodyTabella;

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

procedure AggiungiElementoTabella(elemento VARCHAR2 default '') IS
BEGIN
	htp.prn('<td>'|| elemento || '</td>');
end AggiungiElementoTabella;

procedure ApriFormFiltro(azione VARCHAR default '') IS
begin
	htp.prn('<form action="'|| azione ||'" method="get">
            	<table class="inputTAB">
                	<tr>');
end ApriFormFiltro;

procedure AggiungiCampoFormFiltro(tipo VARCHAR2 default 'text',valore VARCHAR2 default '',  placeholder VARCHAR2 default '', onclick VARCHAR2 default '') IS
begin
	htp.prn('<td> <input type="'||tipo||'" placeholder="'||placeholder||'" value="'|| valore ||'" onclick="'|| onclick ||'"> </td>');
end AggiungiCampoFormFiltro;

procedure chiudiFormFiltro IS
begin
	htp.prn('</tr> </table> </form>');
end chiudiFormFiltro;

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

procedure aggiungiScript(testo VARCHAR2) is
BEGIN
	htp.prn('<script type="text/javascript">'|| testo ||'</script>');
END aggiungiScript;

procedure Footer is
BEGIN
	gui.APRIDIV(ident => 'footer');
	htp.prn('<footer>');
	gui.APRIDIV(ident => 'bottoneSinistra');
		gui.Bottone(testo => 'Contattaci', classe => 'button-48'); 
		gui.Bottone(testo => 'Su di noi', classe => 'button-48'); 
		gui.Bottone(testo => 'Termini di servizio', classe => 'button-48'); 
		gui.Bottone(testo => 'Privacy', classe => 'button-48'); 
	gui.CHIUDIDIV;
	htp.prn('</footer>');
	gui.CHIUDIDIV;
END Footer;

end gui;


/* Form */