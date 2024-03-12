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
	gui.apriDiv(classe => 'bottoniSinistra'); 
	gui.Bottone(testo => 'clienti', classe => 'button-48'); 
	gui.Bottone(testo => 'prenotazioni', classe => 'button-48'); 
	gui.Bottone(testo => 'taxi', classe => 'button-48'); 
	gui.Bottone(testo => 'turni', classe => 'button-48'); 
	gui.chiudiDiv();

	gui.Bottone(testo => 'login', classe => 'bottone2');
	gui.ChiudiDiv();
	end TopBar;

end gui;
