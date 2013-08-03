<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="background.*" import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script type="text/javascript">
checked=false;
function disp_confirm(text,address){
	var r=confirm('are you sure to '+text+' ?');
	if(r==true && text=='purchase'){
		//window.open(address, 'newwindow', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');
		alert('purchase confirmed');
		var button=document.getElementById('purchase');
		button.style.display   =   "none"; 
		button=document.getElementById('cancel purchase');
		button.style.display   =   "none"; 
		button=document.getElementById('goback');
		button.style.display   =   "inherit"; 
		
	}else if(r==true ){
		window.location.assign('SearchPage.jsp');
	}
}

function set(b){
	 var a=document.getElementById(b);
	 a.style.fontWeight="bold";
	 a.style.background="#F0F3F4";
	}
	function reset(b){
	 var a=document.getElementById(b);
	 a.style.fontWeight="";
	 a.style.background="";
	}

function disableAButton(){
	var button=document.getElementById('goback');
	button.style.display   =   "none"; 
}
</script>

<html>
<head>

<style type="text/css">
.header{
	font-size: 15px;
	font-weight:bold;
}
.fontSize
{
	font-size: 12px;
} 

.STYLE2 {color: #CC0099}

.tableContent{
	border-bottom-width:thick
	border-left-width:thick
	border-right-width:thick
	border-top-width:thick
	border-color:#000000
}
.STYLE11 {color: #FFFFFF; font-weight: bold; }
.button{
	width:20px;
	height:20px;
	border:1;
	color:#FF0000;
	outline-color: #000000;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: large;
	font-weight: bold;
}
-->
</style>
</head>
<body onload='disableAButton()'>

<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#D1D1D1" bgcolor="#FFFFFF">
<!-- this table is just for better outlook of the site -->
  <tr>
    <td>
    <table width="100%" align="center"  class="tableContent" id='resultTable' border="0" bordercolor="white" cellpadding="0" cellspacing="0">
	
	
<%
ArrayList<Album> albums=(ArrayList<Album>)session.getAttribute("resultAlbum");
System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+albums);
ArrayList<Song> songs=(ArrayList<Song>)session.getAttribute("resultSongs");
System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+songs);
String type=(String)session.getAttribute("resultType");
System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+type);
String purchased=(String)request.getParameter("OK");
System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+purchased);
int count1=0;
int count2=0;
float sum=0;     
if(type.equals("A")){%>
	<tr align="left" valign="middle" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="header" bgcolor="#E5EBF1" >
		<td bgcolor="#C4CFD9" width="1%" >
			No.	</td>			
		<td width="20%">
			AlbumTitle&nbsp;&nbsp;				</td>
		<td  width="15%">
			Album Artist&nbsp;&nbsp;				</td>
		<td width="10%">
			AlbumGenre&nbsp;&nbsp;				</td>
		<td  width="24%">
			AlbumPublisher&nbsp;&nbsp;
		<td width="5%">
			AlbumPrice&nbsp;&nbsp;				</td>
		</td>
		<td width="5%">
			AlbumDate&nbsp;&nbsp;				</td>
	</tr>
	<%	
		for(int i=0;i<albums.size();i++){
			String albumName=(String)request.getParameter(albums.get(i).getAlbumTitle());
			if(albumName==null)
				continue;
			count1++;
			sum+=Float.parseFloat(albums.get(i).getAlbumPrice());
			%>
		
			<tr class="fontSize" height="30" id="<%=count1 %>" onMouseOver="set('<%=count1 %>')" onMouseOut="reset('<%=count1 %>')">
					<td>
						<%=count1 %>&nbsp;
				    </td>
				    <td>
						<%=albums.get(i).getAlbumTitle()%>&nbsp;
				    </td>
					<td>
						<%=albums.get(i).getAlbumArtist()%>&nbsp;
					</td>
					<td>
						<%=albums.get(i).getAlbumGenre()%>&nbsp;
					</td>
					<td>
						<%=albums.get(i).getAlbumPublisher()%>&nbsp;
					</td>
					<td>
						<%=albums.get(i).getAlbumPrice()%>&nbsp;
					</td>
					<td>
						<%=albums.get(i).getAlbumDate()%>&nbsp;
					</td>
			</tr>
				
		
	<%}
}else{%>
		<tr align="left" valign="middle" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="header" bgcolor="#E5EBF1" >
						<td width="1%" bgcolor="#C4CFD9">
							No.				</td>
						<td  width="20%">Song Title&nbsp;&nbsp;
																</td>
						<td  width="8%">
							SongArtist&nbsp;&nbsp;				</td>
						<td  width="2%">
							SongPrice&nbsp;&nbsp;				</td>
						<td  width="10%">
							AlbumTitle&nbsp;&nbsp;				</td>
						<td width="10%">
							AlbumArtist&nbsp;&nbsp;				</td>
						<td width="2%">
							Album Genre&nbsp;&nbsp;				</td>
						<td width="10%">
							AlbumPublisher&nbsp;&nbsp;
						<td width="5%">
							AlbumPrice&nbsp;&nbsp;				</td>
		  			  <td width="5%">
					  		AlbumDate&nbsp;&nbsp;				</td>
				   </tr>
	<%
		Album temp=null;
		int numberOfSongs=0;
		
		for(int i=0;i<songs.size();i++){
			String songName=(String)request.getParameter(songs.get(i).getSongTitle());
			
			if(songName==null)
				continue;
			
			count2++;
			sum+=Float.parseFloat(songs.get(i).getSongPrice());
			Album ab=songs.get(i).getAlbum(albums,songs.get(i).getSongTitle());
			System.out.println("-----------------------------------I am doing ALbum: "+ab.getAlbumTitle()+"of size= "+ab.getNumberOfSongs());
			if(temp!=null && ab.getAlbumTitle().equals(temp.getAlbumTitle())){
				numberOfSongs++;
				System.out.println("-----------------------------------numberOfSongs is now:"+numberOfSongs);
				//if the number of picked songs equal to the number of the songs in one Album
				if(numberOfSongs==ab.getNumberOfSongs()){
					System.out.println("-----------------------------------There is been a discount on Album:"+ab.getAlbumTitle());
					sum-=ab.getSongPrices();
					sum+=Float.parseFloat(ab.getAlbumPrice());
					numberOfSongs=0;
				}
			}else{
				numberOfSongs++;
				temp=ab;
			}
		
		
		%>
		<tr height="30" class="fontSize" id='<%=count2 %>' onMouseOver="set('<%=count2 %>')" onMouseOut="reset('<%=count2 %>')">
				<td>
						<%=count2 %>&nbsp;
				</td>
				<td>
					<%=songs.get(i).getSongTitle()%>&nbsp;
				</td>
				<td>
					<%=songs.get(i).getSongArtist()%>&nbsp;
				</td>
				<td>
					<%=songs.get(i).getSongPrice()%>&nbsp;
				</td>
				<td height="30" align="left">
									<%=ab.getAlbumTitle()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=ab.getAlbumArtist()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=ab.getAlbumGenre()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=ab.getAlbumPublisher()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=ab.getAlbumPrice()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=ab.getAlbumDate()%>&nbsp;							  </td>
				
		</tr>
	<%}
}
DecimalFormat   fnum   =   new   DecimalFormat("##0.00");  
String   dd=fnum.format(sum);  
%>
</table>
</td>
  </tr>
</table>

<table border='1' align='center' width="250">
<tr>
	<td>

<table border="0"  align="center" cellpadding="0" cellspacing="0" bordercolor="#D1D1D1" bgcolor="#FFFFFF" width="250">
	<tr align='right' valign="top">
		<td colspan='2' align='right' valign="top">
			<input id='cancel purchase' title='Press to Cancel the Purchase' type="submit" value="X" onClick="disp_confirm('Cancel purchase','SearchPage.jsp')"  class="button">
		</td>
	</tr>
	<tr height='50' width="200">
		<td colspan="2" align='center' class="header" bgcolor="#E5EBF1">
		  CHECK OUT COUNTER		</td>
	</tr>
	<tr onMouseOver="set(1111)" onMouseOut="reset(1111)" height='30' >
			<%if(count1>0){%>
				<td align='right' width='75'>
					Albums:&nbsp;&nbsp;
				</td>
				<td align='left' width='175' id='1111'>
					<%=count1 %>
				</td>
			<%}else{%>
				<td align='right' width='75'>
					Songs:&nbsp;&nbsp; 
				</td>
				<td align='left' width='175' id='1111'>
					<%=count2 %>
				</td>				
			<%}%>	
		
	</tr>
	<tr onMouseOver="set(1112)" onMouseOut="reset(1112)" height='30'>
		<td align="right" width='200'>
			Total($):		</td>
		<td align="left" width='50' id='1112'>
			<%=dd %>
		</td>
	</tr>
	<tr>
		<td colspan='2' align='center'>
			<input id='purchase' type="submit" value="Purchase" onClick="disp_confirm('purchase', 'checkedout.jsp')">
		</td>
	</tr>
	<tr>
		<td colspan='2' align='center'>
			<input id='goback' type="submit" value="More Songs!" onClick="disp_confirm('Purchase Again', 'SearchPage.jsp')">
		</td>
	</tr>
</table>
	</td>
</tr>
</table>
</body>
</html>

