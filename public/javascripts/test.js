// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function sayHello(){
	alert("Hello World");
}

var xmlHttp;

function startRequest(){
	var name = document.getElementById("name").value;
	if(name != ""){
		try {
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				xmlHttp = null;
			}
		}
		if(!xmlHttp && typeof XMLHttpRequest != "undefined"){
			xmlHtpp = new XMLHttpRequest();
		}
		xmlhttp.open("GET","/posts/index",true);
		alert("hello")
		xmlHtpp.open("GET","/ajax/checkName/1?name='tina'",true);
		xmlHtpp.onreadystatechange = handleStateChange;
		xmlHtpp.send(null);
	}else{
		document.getElementById("test").value="please enter you name";
	}
}

function handleStateChange(){
	alert(xmlHtpp.readyState);
	if(xmlHtpp.readyState<4){
		document.getElementById("test").value="reading the data now....";
	}
	if(xmlHtpp.readyState == 4){
		if(xmlHtpp.status == 200){
			document.getElementById("span").innerHTML = xmlHttp.responseText;
		}
	}
	else{
		alert("error");
	}
}

