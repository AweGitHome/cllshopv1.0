function show_page1(){
	/**默认页**/
	document.getElementById('page1').style.display="block";
	document.getElementById('page2').style.display="none";
	document.getElementById('page3').style.display="none";
	document.getElementById('page4').style.display="none";
	document.getElementById('page5').style.display="none";
	document.getElementById('page6').style.display="none";
}
function show_page2(){
	/**商品**/
	document.getElementById('page2').style.display="block";
	document.getElementById('page1').style.display="none";
	document.getElementById('page3').style.display="none";
	document.getElementById('page4').style.display="none";
	document.getElementById('page5').style.display="none";
	document.getElementById('page6').style.display="none";
}
function show_page3(){
	/**订单**/
	document.getElementById('page3').style.display="block";
	document.getElementById('page1').style.display="none";
	document.getElementById('page2').style.display="none";
	document.getElementById('page4').style.display="none";
	document.getElementById('page5').style.display="none";
	document.getElementById('page6').style.display="none";
}
function show_page4(){
	/**系统管理默认**/
	document.getElementById('page4').style.display="block";
	document.getElementById('page1').style.display="none";
	document.getElementById('page2').style.display="none";
	document.getElementById('page3').style.display="none";
	document.getElementById('page5').style.display="none";
	document.getElementById('page6').style.display="none";
}
function show_page5(){
	/**用户管理**/
	document.getElementById('page5').style.display="block";
	document.getElementById('page1').style.display="none";
	document.getElementById('page2').style.display="none";
	document.getElementById('page3').style.display="none";
	document.getElementById('page4').style.display="none";
	document.getElementById('page6').style.display="none";
}
function show_page6(){
	/**审核管理**/
	document.getElementById('page6').style.display="block";
	document.getElementById('page1').style.display="none";
	document.getElementById('page2').style.display="none";
	document.getElementById('page3').style.display="none";
	document.getElementById('page4').style.display="none";
	document.getElementById('page5').style.display="none";
}