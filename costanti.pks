SET DEFINE OFF;
create or replace PACKAGE costanti as

tableSortScript CONSTANT VARCHAR2(32767) := '
var lastSortedTH;
var ordTH = true;
    
const getCellValue = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent;

const comparer = (idx, asc) => (a, b) => ((v1, v2) => 
  v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
  )(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));

document.querySelectorAll("th").forEach(th => th.addEventListener("click", (() => {
  const table = th.closest("table");
  const l = th.innerText.length;
  
  if(lastSortedTH == th) {
    ordTH ?
      th.innerText = th.innerText.substring(0, l-1) + "▴"
      : th.innerText = th.innerText.substring(0, l-1) + "▾";
  }else {

    if (lastSortedTH)  lastSortedTH.innerText = lastSortedTH.innerText.substring( 0, lastSortedTH.innerText.length-1);
    ordTH ? th.innerText += " ▴"
        : th.innerText += " ▾";
    lastSortedTH = th;
  }

  ordTH = !ordTH;

  Array.from(table.querySelectorAll("tr:nth-child(n+2)"))
    .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
    .forEach(tr => table.appendChild(tr) );
})));';

dropdownScript constant VARCHAR2(32767) := '
 
 const updateHiddenInput = (inputName, checkbox, symbol = ";") => {
    if (!checkbox) throw new Error("Checkbox non trovata");
    if (!symbol) symbol = ";";

    const input = document.getElementsByName(inputName)[0];

    if (!input) throw new Error("Elemento " + inputName + " non trovato");

    const values = input.getAttribute("value");
    const value = checkbox.getAttribute("value");

    const newValues = values ? values.split(symbol) : [];
    if (checkbox.checked) {
        // aggiungi value a values
        newValues.push(value);
        newValues.sort();
        input.setAttribute("value", newValues.join(symbol));
    } else {
        // elimina value da values
        const index = newValues.indexOf(value);

        if (index == -1)
            return;

        newValues.splice(index, 1);
        input.setAttribute("value", newValues.join(symbol));
    }
}';


/* 32767 è la dimensione massima di varchar2 */
scriptjs constant varchar2(32767) := q'[

function closeBox(id){
  document.getElementById(id).classList.add("error-box-hidden");
}

function apriMultiSelect(multiselect) {
  var contenutoMenu = multiselect.querySelector(".multiSelect-content");
  var freccia = multiselect.querySelector(".multiSelectBtn .arrow");
  var opzioni = contenutoMenu.querySelectorAll("#option");

  if (contenutoMenu.style.display === "none") {
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

function apriMenu(dropdown) {
  var contenutoMenu = dropdown.querySelector(".dropdown-content");
  var freccia = dropdown.querySelector(".dropbtn .arrow");
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

function mostraConferma(riga, url) {
    // Controlla se la riga di conferma è già presente altrimenti la crea
    if (!riga.nextElementSibling || !riga.nextElementSibling.classList.contains('rigaConferma')) {
        var nuovaRiga = document.createElement("tr");
        nuovaRiga.classList.add('rigaConferma'); 
        var nuovaCella = nuovaRiga.insertCell(0);
        nuovaCella.colSpan = riga.cells.length; //Non funziona
        
        nuovaCella.innerHTML = "Sicuro di voler cancellare? " + 
                                "<button onclick=\"apriURL('" + url + "')\">Sì</button> " + 
                                "<button onclick=\"annullaEliminazione(this.parentNode.parentNode)\">No</button>";
        
        // Inserisci la nuova riga dopo la riga corrente
        riga.parentNode.insertBefore(nuovaRiga, riga.nextSibling);
    }
}

function apriURL(url) {
    window.location.href = url; // Apre l'URL nella stessa finestra
}

function annullaEliminazione(rigaConferma) {
    // Rimuove la riga di conferma se viene cliccato no
    rigaConferma.parentNode.removeChild(rigaConferma);
}

function mostraPopup() {
    var popup = document.getElementById("popup-message");
    popup.style.display = "block";
}

// Funzione per nascondere il popup
function nascondiPopup() {
    var popup = document.getElementById("popup-message");
    popup.style.display = "none";
}

]';

dropdownScript constant VARCHAR2(32767) := '
 
 const updateHiddenInput = (inputName, checkbox, symbol = ";") => {
    if (!checkbox) throw new Error("Checkbox non trovata");
    if (!symbol) symbol = ";";

    const input = document.getElementsByName(inputName)[0];

    if (!input) throw new Error("Elemento " + inputName + " non trovato");

    const values = input.getAttribute("value");
    const value = checkbox.getAttribute("value");

    const newValues = values ? values.split(symbol) : [];
    if (checkbox.checked) {
        // aggiungi value a values
        newValues.push(value);
        newValues.sort();
        input.setAttribute("value", newValues.join(symbol));
    } else {
        // elimina value da values
        const index = newValues.indexOf(value);

        if (index == -1)
            return;

        newValues.splice(index, 1);
        input.setAttribute("value", newValues.join(symbol));
    }
}';

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
  height: 6vh;
  width:100%;
  position: fixed;
  padding: 1px 0px 1px 0px;
  top:0px;
  left:0px;
  z-index:999; /*mi assicuro che la top bar sia sempre il primo elemento della pagina*/   
}

.bottoniSinistra {
  display: flex; /* Make the wrapper a flexbox container */
  flex-shrink: 0; /* Prevent wrapper from shrinking */
}

.bottoniDestra {
  display: flex; /* Make the wrapper a flexbox container */
  flex-shrink: 0; /* Prevent wrapper from shrinking */
  padding-right: 10px;
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
  /*display: inline-block;*/
  /*font-family: Clarkson,Helvetica,sans-serif;*/
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0;
  line-height: 1vh;
  margin: 0px;
  opacity: 1;
  outline: 0;
  padding: 2.5vh 2.2em;
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
  max-width: 100vw;
  margin: 0px;
  padding: 0px;
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
  min-height: calc(84vh - 2px);
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

    tr, td{
    border: 1px solid rgba(0, 0, 0, 0.565);
    height: 35px;
    font-size: small;
    text-align: center;
    }

    td{
    border-right: 0px solid white;
    border-left: 0px solid white;
    }

    tr:hover{
      background-color: rgba(27, 26, 26, 0.065);
    }

    th{
        background-color: rgba(0, 0, 0, 0.241);
        height: 45px;
        font-size: large;
    }

    th:first-child{
        border-top-left-radius: 5px;
    }

    th:last-child{
        border-top-right-radius: 5px;
    }

    td:last-child{
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        border: 0px;
    }

    img{
        width: 15px;
        height: 15px;
    }

    button{
      background-color: #000000; 
      color: white; 
      padding: 7px 20px;
      border: none; 
      border-radius: 10px; 
      cursor: pointer;
    }
}

    td:last-child{
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        border: 0px;
    }

    img{
        width: 15px;
        height: 15px;
    }

    button{
      background-color: #000000; 
      color: white;
      padding: 5px;
      border: none;
      margin: 0px;
      border-radius: 10px; 
      cursor: pointer;
      min-width: 30px;
    }
}
.inputTAB{
  
  display: table;
  border-collapse: collapse;
  border-radius: 5px;
  width: 100%;
  height:auto;
  table-layout: fixed;
  border-style: hidden;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.565);
  background-color: rgba(27, 26, 26, 0.065);

  td{
      margin: 0px;
      padding: 3px;
      height: max-content;
  }

  td:last-child{
      padding-right: 6px !important;
  }

  td:first-child{
      padding-left: 6px !important;
  }

  tr:last-child{
    margin-bottom: 8px;
  }

}

.formField{

    display: block;
    width: auto;
    height: auto;

    label{
        display: block;
        font-size: 0.8em;
        padding-left: 6%;
        margin: 5px;
        margin-left: 2px;
    }

    select{
        display: block;
        outline: none !important;
        border-radius: 5px;
        background-color: white !important;
        border: 1px solid rgba(0, 0, 0, 0.298);
        padding-left:0px;
        padding-left: 3%;
        margin: 0px;
        box-shadow: rgba(0, 0, 0, 0.565) 0px 0px 2px;
        height: 40px;
        font-size: 1em;
        width: 100%;
    }

}

.filterInput{
    display: block;
    /*outline: none !important;*/
    border-radius: 5px;
    border: 1px solid rgba(0, 0, 0, 0.298);
    padding: 0px;
    padding-left: 3%;
    margin: 0px;
    box-shadow: rgba(0, 0, 0, 0.565) 0px 0px 2px;
    height: 40px;
    font-size: 1em;
    width: auto;
    transition: all 0.5s ease;
    width: 100%;
}

.filterInput:focus{
    outline: none;
    border: 1px solid rgba(203, 138, 17, 0.648);
    box-shadow: rgba(139, 96, 15, 0.648) 0px 0px 8px;
      
}

.FilterButton{
    border-radius: 5px;
    border: 1px solid rgba(0, 0, 0, 0.239);
    width: 100%;
    height: 40px;
    margin: 0px;
    padding: 0px;
    box-shadow: rgba(0, 0, 0, 0.533) 0px 0px 3px;
    background-color: #f0d685;
    cursor: pointer;
    font-size: 1.2em;
}

.FilterButton:hover {
    background-color: #f0d685;
    box-shadow: rgba(0, 0, 0, 0.533) 0px 0px 8px;
}
    


.hidden{
    visibility: hidden !important;
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

.form-submit{
    display: flex;
    justify-content : flex-end; 
}
.form-container {
  position : relative; 
  max-width: 38em;
  padding: 1em 3em 2em 3em;
  margin: 0em auto;
  background-color: #fff;
  border-radius: 4.2px;
  box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);

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
    color: #000000;
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
  padding: 1px 0px 1px 0px;
  margin:0px;
  width:100%;
  height: 6vh;
  left:0px;
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

/* MultiSelect nel filtro */

.multiSelect {
  position: relative;
  height: 38px;
  width: auto;
  border-radius: 5px;
  border: 1px solid rgba(0, 0, 0, 0.298);
  box-shadow: rgba(0, 0, 0, 0.565) 0px 0px 2px;
}

.multiSelectBtn {
  border-radius: 4px;
  height:100%;
  width:100%;
  padding: 10px;
  background-color: #000000;
  cursor: pointer;
  box-sizing: border-box;
  color: #FFFFFF;
  font-size: 1em;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
}

.multiSelect-content {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  z-index: 1;
  display: none;
  background-color: #f1f1f1;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border: 1px solid #ddd;

  input[type="checkbox"] {
    margin: 7px 7px 7px 7px;
  }

}

/* TOP BAR DROPDOWN*/
.topbar-dropdown{
  display: inline-block;
}

.topbardropdown-content {
  overflow: hidden;
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  height:auto;
  margin-top:1px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border: 1px solid #ddd;
  z-index: 1;
  cursor: pointer;

  span{
    width: auto;
    float: none;
    padding: 12px 16px;
    display: block;
    text-align: left;
  }

  span:hover{
    background-color: #f0d5856b;
  }
}

.topbar-dropdown:hover .topbardropdown-content{
  display:block;
}


/* DROPDOWN */

.dropdown {
  position: relative;

  select {
    width: 50%;
    line-height: 1.4;
    border: 1px solid #e5e5e5;
    border-radius: 3px;
    background-color: #f9f9f9;
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
}

.dropbtn {
  width: 50%;
  padding: 10px;
  box-sizing: border-box;
  background-color: #f9f9f9;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
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
  overflow: scroll;
  left: 0;
  width: 50%;
  z-index: 1;
  display: none;
  background-color: #f1f1f1;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border: 1px solid;
  border-radius: 3px;
  border-color: #bd8200;

  
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
  border-top: 6px solid #4f4f4f;
  transform: rotate(-90deg);
  transition: transform 0.3s;
}


.button-add-container {
  background-color: blue;
  position: relative;
}

.button-add {
  position: absolute;
  background-color: black;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  top: 50%;
  right: 0;
  transform: translateY(-100%);
}
.button-tab {
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
  opacity: 1;
  outline: 0;
  padding: 5px 8px 5px 8px !important;
  position: relative;
  text-align: center;
  text-decoration: none;
  text-rendering: geometricprecision;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  white-space: nowrap;
}

.bottone-popup {
  flex-direction: column;
  align-items: center;
  padding: 6px 14px;
  font-family: -apple-system, BlinkMacSystemFont, sans-serif;
  border-radius: 6px;
  color: #3D3D3D;
  background: #fff;
  border: none;
  box-shadow: 0px 0.5px 1px rgba(0, 0, 0, 0.1);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  cursor: pointer; 
}

.bottone-popup:hover {
    cursor: pointer; 
}

.bottone-popup:focus {
  box-shadow: 0px 0.5px 1px rgba(0, 0, 0, 0.1), 0px 0px 0px 3.5px rgba(58, 108, 217, 0.5);
  outline: 0;
}

';
end costanti;