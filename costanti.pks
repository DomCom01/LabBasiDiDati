create or replace package costanti as

/* 32767 è la dimensione massima di varchar2 */
scriptjs constant varchar2(32767) := q'[

function closeBox(id){
  document.getElementById(id).classList.add("error-box-hidden");
}

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

function mostraConferma(riga) {
    // Controlla se la riga di conferma è già presente
    if (!riga.nextElementSibling || !riga.nextElementSibling.classList.contains('rigaConferma')) {
        // Crea la riga di conferma
        var nuovaRiga = document.createElement("tr");
        nuovaRiga.classList.add('rigaConferma'); 
        var nuovaCella = nuovaRiga.insertCell(0);
        nuovaCella.colSpan = riga.cells.length; // Imposta il colspan sulla base del numero di colonne nella riga(Non funziona)
        nuovaCella.innerHTML = "Sicuro di voler cancellare? <button onclick=\"confermaEliminazione(this.parentNode.parentNode)\">Sì</button> <button onclick=\"annullaEliminazione(this.parentNode.parentNode)\">No</button>";
        riga.parentNode.insertBefore(nuovaRiga, riga.nextSibling);
    }
}

function confermaEliminazione(rigaConferma) {
    //Per ora semplicemente ricarica la pagina
    window.location.reload();
}

function annullaEliminazione(rigaConferma) {
    // Rimuove la riga di conferma se viene cliccato no
    rigaConferma.parentNode.removeChild(rigaConferma);
}


]';
	stile constant varchar(32767) := '

html{
  margin:0px;
}

.bottone {
  background: #cfab3a;
  border-radius: 999px;
  box-shadow: #f0d685 0 10px 20px -10px;
  box-sizing: border-box;
  color: #0c0b07;
  cursor: pointer;
  font-size: 16px;
  font-weight: 700;
  line-height: 24px;
  opacity: 1;
  outline: 0 solid transparent;
  padding: 8px 18px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: none;
  margin-right: 20px;
}

.bottone2 {
  background-color: #cfab3a;
  border-radius: 12px;
  color: #000;
  cursor: pointer;
  font-weight: bold;
  padding: 10px 15px;
  text-align: center;
  transition: 200ms;
  width: fit-content;
  box-sizing: border-box;
  border: 0;
  font-size: 16px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.bottone2:not(:disabled):hover,
.bottone2:not(:disabled):focus {
  outline: 0;
  background: #f0d685;
  box-shadow: 0 0 0 2px rgba(0,0,0,.2), 0 3px 8px 0 rgba(0,0,0,.15);
}

.bottone2:disabled {
  filter: saturate(0.2) opacity(0.5);
  -webkit-filter: saturate(0.2) opacity(0.5);
  cursor: not-allowed;
}

#top-bar {
  display: flex; /* Makes the top bar a flexbox container */
  justify-content: space-between; /* Distributes buttons evenly */
  align-items: center; /* Aligns buttons vertically */
  background-color: #0c0b07;
  padding: 1px;
  width:100%;
  position: fixed;
  top:0px;
  left:0px;
  z-index:999; /*mi assicuro che la top bar sia sempre il primo elemento della pagina*/   
}

.bottoniSinistra {
  display: flex; /* Make the wrapper a flexbox container */
  flex-shrink: 0; /* Prevent wrapper from shrinking */
  height: 8vh;
}

.bottoniDestra {
  display: flex; /* Make the wrapper a flexbox container */
  flex-shrink: 0; /* Prevent wrapper from shrinking */
}

/* CSS */

.button-48 {
  appearance: none;
  background-color: #0c0b07;
  border-width: 0;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-block;
  /*font-family: Clarkson,Helvetica,sans-serif;*/
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0;
  line-height: 1em;
  margin: 1;
  margin-right: 1px;
  opacity: 1;
  outline: 0;
  padding: 1.5em 2.2em;
  position: relative;
  text-align: center;
  text-decoration: none;
  text-rendering: geometricprecision;
  /*text-transform: uppercase;*/
  transition: opacity 300ms cubic-bezier(.694, 0, 0.335, 1),background-color 100ms cubic-bezier(.694, 0, 0.335, 1),color 100ms cubic-bezier(.694, 0, 0.335, 1);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  white-space: nowrap;
}

.button-48:before {
  animation: opacityFallbackOut .5s step-end forwards;
  backface-visibility: hidden;
  background-color: #f0d685;
  clip-path: polygon(-1% 0, 0 0, -25% 100%, -1% 100%);
  content: "";
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  transform: translateZ(0);
  transition: clip-path .5s cubic-bezier(.165, 0.84, 0.44, 1), -webkit-clip-path .5s cubic-bezier(.165, 0.84, 0.44, 1);
  width: 100%;
}

.button-48:hover:before {
  animation: opacityFallbackIn 0s step-start forwards;
  clip-path: polygon(0 0, 101% 0, 101% 101%, 0 101%);
}

.button-48:after {
  background-color: #FFFFFF;
}

.button-48 span {
  z-index: 1;
  position: relative;
}

/* Roba tabella */
body{ 
  width: 100vw;
  margin: 0px;
  font-family: Helvetica,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Noto Color Emoji","Segoe UI Symbol","Android Emoji",EmojiSymbols,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans",sans-serif;
  background-color: #e3e3e3;
}

.container{
  display: flex;
  justify-content: center;
  align-items: center;
  margin:0px;
}

.contentContainer{
  width: 80%; /* Allargato per far entrare bene anche tabelle grandi */
  min-height: 82.7vh;
  padding-top: 10vh;
  margin:0px;
}

.tab{
    border-collapse: collapse;
    border-radius: 5px;
    width: 100%;
    table-layout: fixed;
    border-style: hidden;
    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.565);
}

.tab button{
  background-color: #000000; 
	color: white; 
	padding: 7px 20px;
	border: none; 
	border-radius: 10px; 
	cursor: pointer;
}

.tab tr, td{
    border: 1px solid rgba(0, 0, 0, 0.565);
    height: 35px;
    font-size: small;
    text-align: center;
}

.tab td{
    border-right: 0px solid white;
    border-left: 0px solid white;
}

.tab tr:hover{
    background-color: rgba(27, 26, 26, 0.065);
}

.tab th{
    background-color: rgba(0, 0, 0, 0.241);
    height: 45px;
    font-size: large;
}

.tab th:first-child{
    border-top-left-radius: 5px;
}

.tab th:last-child{
    border-top-right-radius: 5px;
}

.tab td:last-child{
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    border: 0px;
}

.tab img{
    width: 15px;
    height: 15px;
}

.inputTAB{
  
  border-collapse: collapse;
  border-radius: 5px;
  width: 100%;
  table-layout: fixed;
  border-style: hidden;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.565);
  background-color: rgba(27, 26, 26, 0.065);

  select, select:focus{
    outline: none !important;
    margin: 0px;
    border: 0px;
    padding: 0px;
    width: 100%;
    background-color: transparent;
    text-align: center;
  }

  .inputTAB td{
    border: 1px solid rgba(0, 0, 0, 0.565);
    width: 100%;
  }
  
  input, input:focus{
    outline: none !important;
    border: 0px;
    width: auto;
    text-align: center;
    background-color: transparent;
    width:100%;
    padding:0px;
  }*/

  input[type=submit]{
    height: 100%;
    width: 100%;
    margin: 0px;
    border-radius: 0px 5px 5px 0px;
    background-color: #f0d685;
    font-size: large;
  }

  input[type=submit]:hover {
    height: 100%;
    width: 100%;
    margin: 0px;
    border-radius: 0px 5px 5px 0px;
    background-color: #cfab3a;
    font-size: large;
  }
}

.inputTAB td:last-child{
    padding: 0px;
}

form{
    padding: 0px;
    margin: 0px;
}

h1{
  margin:0px;
  text-align:center;
}

/*Roba per form
    URL : https://codepen.io/arefeh_htmi/pen/mdPYZKJ */

input,
input[type="radio"] + label,
input[type="checkbox"] + label:before,
select option,
select {
  width: 100%;
  padding: 1em;
  line-height: 1.4;
  background-color: #f9f9f9;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}

input[type="radio"] {
  display: none;
}

input[type="radio"] + label,
select {
  display: inline-block;
  width: 50%;
  text-align: center;
  float: left;
  border-radius: 0;
  color : #000;
}

input[type="radio"] + label:first-of-type {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}

input[type="radio"] + label:last-of-type {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}

input[type="radio"] + label i {
  padding-right: 0.4em;
}

input[type="radio"]:checked + label,
input:checked + label:before,
select:focus,
select:active {
  background-color: #f0d685;
  color: #fff;
  border-color: #bd8200;
}

input[type="checkbox"] {
  display: none;
}

input[type="checkbox"] + label {
  position: relative;
  display: block;
  padding-left: 1.6em;
}

input[type="checkbox"] + label:before {
  position: absolute;
  top: 0.2em;
  left: 0;
  display: block;
  width: 1em;
  height: 1em;
  padding: 0;
  content: "";
}

input[type="checkbox"] + label:after {
  position: absolute;
  top: 0.45em;
  left: 0.2em;
  font-size: 0.8em;
  color: #fff;
  opacity: 0;
  font-family: FontAwesome;
  content: "\f00c";
}

input[type=submit]{
    height: 100%;
    width: 30%;
    margin: 0px;
    border-radius: 0px 5px 5px 0px;
    background-color: #f0d685;
    font-size : large; 
    font-weight: bold;  
  }

  input[type=submit]:hover {
    height: 100%;
    width: 30%;
    margin: 0px;
    border-radius: 0px 5px 5px 0px;
    background-color: #cfab3a;
    font-size: large;
  }

  .form-submit{
    display: flex;
    justify-content : flex-end; 
  } 

input:checked + label:after {
  opacity: 1;
}

input:focus {
  outline: 0;
  border-color: #f0d685;
}

input:focus + .input-icon i {
  color: #f0d685;
}   

input:focus + .input-icon:after {
  border-right-color: #f0d685;
}

h2, h4{
  color: #f0d685;
}

.form-container {
  position : relative; 
  max-width: 38em;
  padding: 1em 3em 2em 3em;
  margin: 0em auto;
  background-color: #fff;
  border-radius: 4.2px;
  box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
}

.form-row {
  zoom: 1;
  margin-bottom: 10px; 
}
.form-row:before,    
.form-row:after {
  content: "";
  display: table;
}
.form-row:after {
  clear: both;
}

.input-group {
  margin-bottom: 1em;
  zoom: 1;
}

.input-group:before,
.input-group:after {
  content: "";
  display: table;
}

.input-group:after {
  clear: both;
}

.input-group-icon {
  position: relative; 
}

.input-group-icon input {
  padding-left: 4.4em;
}

.input-group-icon .input-icon {
  position: absolute;
  top: 0;
  left: 0;
  width: 3.4em;
  height: 3.9em;
  line-height: 3.4em;
  text-align: center;
  pointer-events: none;
}

.input-group-icon .input-icon:after {
  position: absolute;
  top: 0.6em;
  bottom: 1.5em;
  left: 3.4em;
  display: block;
  border-right: 1px solid #e5e5e5;
  content: "";
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}

.input-group-icon .input-icon i {
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  margin-top : 1em;
}

.col-half .input-group {
  display: flex;
  align-items: center;
}

.col-half .input-group input[type="radio"] {
  margin-right: 10px; /* Aggiungo lo spazio tra i radio button se necessario */
}

.col-half {
  float: left;  
  width: 50%;
  margin-bottom: 10px;
}
.col-half:last-of-type {
  padding-right: 0;
}
.col-third {
  padding-right: 10px;
  float : left; 
  width: calc(33.33% - 10px);
}
.col-third:last-of-type {
  padding-right: 0;
}
@media only screen and (max-width: 540px) {
  .col-half {
    width: 100%;
    padding-right: 0;
  }
}
/* FOOTER */
#footer {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #0c0b07;
  padding-top: 1px;
  padding-bottom: 1px;
  margin:0px;
  width:100%;
  left:0px;
  margin-bottom : 0px; 
}

.message-box{
  height: auto;
  padding: 20px;
  display: flex;
  border-radius: 5px;
  justify-content: space-between;
  justify-items: center;

  p{
    padding: 0px;
    margin: 0px;
    align-self: center;
    justify-self: center;
    font-size: 1.2em;
  }

  .closeIcon{
    cursor: pointer;
  }

  img{
    height: 27px;
    width: 27px;
    cursor: pointer;
  }

}

.error{
  border: 2px solid rgba(212, 1, 1, 0.749);
  background-color: rgba(255, 0, 0, 0.037);
}

.success{
  border: 2px solid rgba(68, 212, 1, 0.749);
  background-color: rgba(0, 255, 0, 0.037);
}


.error-box-hidden {
  -webkit-animation: fadeOut 1s;
  animation: fadeOut 1s;
  animation-fill-mode: forwards;
}

@keyframes fadeOut {
  0% { opacity: 1; height: 100%;}
  100% { opacity: 0; display: none; height: 0%;} /* display block/none?*/
}

/* DROPDOWN */

.dropdown {
  position: relative;
}

.dropbtn {
  width: 101px;
  padding: 10px;
  box-sizing: border-box;
  background-color: #000000;
  border: none;
  cursor: pointer;
  color: #FFFFFF;
  font-size: 10px;
  text-align: left;
  font-family: arial;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
}

.dropdown-content {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100px;
  z-index: 1;
  display: none;
  background-color: #f1f1f1;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border: 1px solid #ddd;
}

.text {
  flex-grow: 1;
  text-align: center;
}

.arrow {
  display: inline-block;
  width: 0;
  height: 0;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-top: 6px solid #fff;
  transform: rotate(-90deg);
  transition: transform 0.3s;
}

select {
  width: 100%;
  height: 100%;
  border: none;
  background-color: transparent;
  padding: 10px;
  margin: 0;
  box-sizing: border-box;
  text-align: left;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  list-style: none;
  outline: none;
}

option {
  width: 100%;
  padding: 1px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  cursor: pointer;
}

option:hover {
  background-color: #ddd;
}

option input[type="checkbox"] {
  margin: 0 7px 0 0;
  vertical-align: middle;
}

option .tick {
  display: none;
}

option input[type="checkbox"]:checked + .tick {
  display: inline-block;
}

option .tick::before {
  content: "";
  display: block;
  width: 5px;
  height: 10px;
  border-left: 2px solid #000;
  border-bottom: 2px solid #000;
  transform: rotate(45deg);
}

';
end costanti;