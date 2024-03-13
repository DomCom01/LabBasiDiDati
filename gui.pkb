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
 	htp.headClose; 
	gui.ApriBody(idSessione);
    
end ApriPagina;

procedure ApriBody(idSessione int default 0) is
begin
  htp.print('<body>');
  gui.ApriDiv();
  gui.TopBar(); --Modificare if sotto per aggiungere TopBar con saldo e menu profilo se utente registrato, altrimenti niente
  gui.ChiudiDiv;
  gui.ApriDiv('', 'container');
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
	htp.prn('</div>');
	htp.print('</body>');

end ChiudiBody;

procedure Bottone(testo varchar2 default '', nome varchar2 default '', valore varchar2 default '', ident varchar2 default '', classe varchar2 default '') is
begin
	htp.prn('<button type="submit" ');
	
	if ((nome != '' and nome is not null) and (valore != '' and valore is not null)) then
		htp.prn('name="' || nome || '"  value="' || valore || '" ');
	end if;
	
	htp.prn('id="' || ident || '" class="' || classe || '">');
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
procedure ApriTabellaNonModificabile is
begin
	htp.prn('<table class="tab"> ');
	--htp.prn('</table>');

end ApriTabellaNonModificabile;

procedure ApriHeaderTabella IS
BEGIN
	htp.prn('<thead>');
	htp.prn('<tr>');
end ApriHeaderTabella;

procedure AggiungiHeaderTabella(elemento VARCHAR2 default '') IS
BEGIN
	htp.prn('<th>'|| elemento ||'</th>');
end AggiungiHeaderTabella;

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

procedure AggiungiCampoFormFilro(tipo VARCHAR2 default 'text',value VARCHAR2 default '',  placeholder VARCHAR2 default '') IS
begin
	htp.prn('<td> <input type="'||tipo||'" placeholder="'||placeholder||'" value="'||value||'"> </td>');
end AggiungiCampoFormFilro;

procedure chiudiFormFiltro IS
begin
	htp.prn('</tr> </table> </form>');
end chiudiFormFiltro;

procedure aggiungiIntestazione(testo VARCHAR2 default 'Intestazione', dimesione VARCHAR2 default 'h1', class VARCHAR2 default '') is
begin
	htp.prn('<'||dimesione||' class='||class||' >'||testo||'</'||dimesione||'>');
end aggiungiIntestazione;

procedure aggiungiParagrafo(testo VARCHAR2 default 'testo', class VARCHAR2 default '') is
begin
	htp.prn('<p class='||class||' >'||testo||'</p>');
end aggiungiParagrafo;

end gui;