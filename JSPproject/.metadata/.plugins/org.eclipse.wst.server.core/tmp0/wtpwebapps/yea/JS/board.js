const indexNum = document.getElementById("indexNum");
const goView = document.getElementById("goView");


function trClick(tr) {
	indexNum.setAttribute("value", tr.rowIndex);
	goView.submit();
}