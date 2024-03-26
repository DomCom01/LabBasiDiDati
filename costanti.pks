create or replace PACKAGE costanti as

scriptJS constant varchar(32767) := '

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

';

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
}

.bottoniSinistra {
  display: flex; /* Make the wrapper a flexbox container */
  flex-shrink: 0; /* Prevent wrapper from shrinking */
  height: 8vh;
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
  }

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

.signupSection{

  display:block;
  height: 300px;
}

.signupForm{
  border: 1px solid black;
  height:200px;

  label{
    padding-left: 10px;
  }
  
}

.formField{
  outline: none !important;
  border-radius: 5px;
  border: 1px solid rgba(0, 0, 0, 0.298);
  padding-left: 10px;
  box-shadow: rgba(0, 0, 0, 0.565) 0px 0px 3px;
  min-height: 40px;
  min-width: 150px;
  font-size: 1.2em;
}

.formField:focus{
  border: 1px solid rgba(139, 96, 15, 0.648);
  box-shadow: rgba(139, 96, 15, 0.648) 0px 0px 5px;
}'; 

END costanti;