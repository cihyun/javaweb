<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
/* reset.css */

@font-face {
    font-family: 'SCoreDream';
    font-weight: 300; 
    font-style: normal; 
    src: url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream3.woff2) format('woff2'),
         url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream3.woff) format('woff');
    font-display: swap;
}

a:link { color: #333; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { font-weight: bold; color: sky; text-decoration: none;}

body {
    font-family: 'SCoreDream';
    font-weight: 300; 
    font-style: normal; 
    src: url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream3.woff2) format('woff2'),
         url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream3.woff) format('woff');
    font-display: swap;
}
.footer {
	margin-bottom: 0px;
	height: 130px;
	background-color: #212529;
	color: #fff;
}
h3, h2, h1 {
	margin-bottom: 30px;
	margin-top: 30px;
}
th {
	background-color: #eee;
	text-align: center;
}
.custom-select {
	width: 100px;
}
/* Guest */

/* PDS */
.page-item.active .page-link {
	border-color: #eee;
}

/* Calender */
#td1, #td8, #td15, #td22, #td29, #td36 {color: red;}
#td7, #td14, #td21, #td28, #td35, #td42 {color: blue;}

#calTable th {
	width: 14%;
	vertical-align: middle;
	height: 80px;
}
#calTable td {
	vertical-align: top;
	text-align: right;
	height: 100px;
}
.today {
	background-color: #e0ffff;
	font-weight: bold;
}
.su {color: red}
.sa {color: blue}
.preNext {
	color: #999;
	font-size: 12px;
}
/*반응형 테이블*/
@media only screen and (max-width: 800px) {
    /* Force table to not be like tables anymore */
	#custom-responsive-table table, 
	#custom-responsive-table thead, 
	#custom-responsive-table tbody, 
	#custom-responsive-table th, 
	#custom-responsive-table td, 
	#custom-responsive-table tr { 
		display: block; 
	}
 
	/* Hide table headers (but not display: none;, for accessibility) */
	#custom-responsive-table thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
 
	#custom-responsive-table tr { border: none; }
	#custom-responsive-table th { text-align:left; }
 
	#custom-responsive-table td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 5%; /*컬럼위치조정*/
		white-space: normal;
		text-align:left;
		
	}
 
	#custom-responsive-table td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		text-align:left;
		font-weight: bold;
	}
 
	/*
	Label the data
	*/
	#custom-responsive-table td:before { content: attr(data-title); }
}

@media only screen and (max-width: 478px) {
	#noCnt {
		width: 50%;
	}
}


</style>