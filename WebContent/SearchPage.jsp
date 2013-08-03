<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="background.*" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- the following 2 functions are for "check all" check box to coordinate with the checked check boxes in the result lists
e.g. static variable checked is false ->set every one of the checked box in form2 as "true" ->then next time it would all become false
-->
<script type="text/javascript">




//this function is for preserving search content
function loadValue( content,  mainSearchType, searchType){
	var searchContent=document.getElementById('searchContent');
	searchContent.value=content;

	for(var i=1; i<3;i++){
		var mainSearchTypeCheckBox=document.getElementById(i);
		if(mainSearchTypeCheckBox.value.match(mainSearchType)){
			mainSearchTypeCheckBox.checked=true;
		}
	}

	for(var i=11;i<15;i++){
		var searchTypeCheckBox=document.getElementById(i);
		if(searchTypeCheckBox.value.match(searchType)){
			searchTypeCheckBox.checked=true;
		}
	}
}




</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
</style>

</head>
<%if(request.getAttribute("searchContent")!=null) {%>
<!-- the following is for retaining search results -->
<body onload='loadValue("<%=request.getAttribute("searchContent") %>","<%=request.getAttribute("mainSearchType") %>","<%=request.getAttribute("searchType")%>")'>
  <%}else{%>
<body>   
  <%}
%>


<form name="form1" action="MyServlet" method="post">
<table width="100%" align="center" cellpadding="0" cellspacing="0"
	background="img5.jpg">
	<tr>
		<td align="center" valign="top">&nbsp;</td>
	</tr>
	<tr>

		<td align="center" valign="top">
			<input name="searchContent" type="text" id="searchContent" size="70" onmouseover="this.focus()"  onfocus="this.select()"> </input>
		</td>
	</tr>
	<tr>

		<td align="center" valign="top">
			<span	class="STYLE11">
			<input id="1" type="radio" 	name="mainSearchType" value="A" checked>Related Albums </input> 
			<input id="2" type="radio"  name="mainSearchType" value="S"> Related Songs </input>
		    </span>
	</td>
	</tr>
	<tr>

		<td align="center" valign="top">
			<span class="STYLE11">
				<input id="11" type="radio"	name="searchType" value="Title" checked> Title </input>
				<input id="12" type="radio"	name="searchType" value="AlbumArtist"> Artist </input>
				<input id="13" type="radio" name="searchType" value="Genre"> Genre </input>
				<input id="14" type="radio" name="searchType" value="Year"> Year </input> 
			</span>
		</td>
	</tr>
	<tr>
		<td colspan=2 align="center" valign="top"><input type="submit" value="SEARCH"></input></td>
	</tr>
</table>
</form>



<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#D1D1D1" bgcolor="#FFFFFF">
<!-- this table is just for better outlook of the site -->
  <tr>
    <td>
    <table width="100%" align="center"  class="tableContent" id='resultTable' border="0" bordercolor="white" cellpadding="0" cellspacing="0">
		<%
			ArrayList<Album> album=(ArrayList<Album>)request.getAttribute("Album");//get the album list with the right songs or albums in it
		    ArrayList<Album> resultAlbum=new ArrayList<Album>();
			if(album!=null && album.size()!=0){
				if(request.getAttribute("mainSearchType").equals("S")){ %>
				
					<!-- if the main search type is "SOngs", then using the following layout -->
					<tr align="left" valign="middle" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="header" bgcolor="#E5EBF1" >
						<td width="1%" bgcolor="#C4CFD9">
							No.				</td>
						<td  width="20%"><input  type="checkbox" id='cabox' name="songs" onclick='checkedAll()';'%></input>Song Title&nbsp;&nbsp;
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
				   int i=(Integer)request.getAttribute("indicator");
					if(i==2){%>
		   	<tr>
		   		<td colspan=10 align="center" class='STYLE2'>
		   		Please NOTE: These are the songs in this album.
		   		</td>
		  	 </tr>
		   	<%}
				   
				}else{ %>
			
			
					<!-- if the main search type is "Album", then using the following layout -->
					<tr align="left" valign="middle" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="header" bgcolor="#E5EBF1" >
						<td bgcolor="#C4CFD9" width="1%" >
							No.				</td>			
						<td width="20%">
					  <input  type="checkbox" id='cabox' name="songs" onclick='checkedAll()';'%></input>AlbumTitle&nbsp;&nbsp;				</td>
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
			 	   
			 	   
			<%System.out.println("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}{{{{{{{{{{{{{{{{{{{{{{{{[ indicator= "+request.getAttribute("indicator"));
			int i=(Integer)request.getAttribute("indicator");
			   if(i==1){
				   System.out.println("asdfasdfasdf");
			   
			   %>
			   <tr>
		   		<td colspan=10 align="center" class='STYLE2'>
		   		Please NOTE: This Album contains the song you are searching for.
		   		</td>
		  	 </tr>
		   <%}
			}
			  ArrayList<Song> songs=null;//use to store songs in each looped Album
			  ArrayList<Song> resultSongs=new ArrayList<Song>();
			  int count=111;/*this is for counting the results, 111 is because it is used for javascripts' functions above
			  				  and ids such as 1s or 10s are already used*/
			  
			  //loop through all the albums that is found
			  for(int i=0;i<album.size();i++){%>
			  
			  
			  <form action="Calculate.jsp" method="post" id="form2">
					<%if(request.getAttribute("mainSearchType").equals("S")){
						songs=album.get(i).getAlbumSong();
						for(int j=0;j<songs.size();j++){
						if(request.getAttribute("searchType").equals("Title") && !request.getAttribute("searchContent").equals(songs.get(j).getSongTitle())&& (Integer)request.getAttribute("indicator")!=2){
							continue;
						}
							/*if((request.getAttribute("mainSearchType").equals("S") && request.getAttribute("searchType").equals("AlbumArtist") && 
									songs.get(j).getSongArtist().equals(request.getAttribute("searchContent")) ) ||
									((request.getAttribute("mainSearchType").equals("S") && !request.getAttribute("searchType").equals("AlbumArtist")) ||
									(!request.getAttribute("mainSearchType").equals("S")))){*/
									
								    resultSongs.add(songs.get(j));
								    count++;
									%>
						
							<tr valign="middle" class="fontSize" id="<%=count %>" >
								<td height="30" align="left">
									<%=count-111 %>&nbsp;							  </td>
								<td height="30" align="left">
									<input id="<%=count+1000 %>" type="checkbox" name="<%=songs.get(j).getSongTitle() %>" onclick='uncheck()' value="<%=songs.get(j).getSongTitle() %>"><%=songs.get(j).getSongTitle() %></input>&nbsp;</td>
								<td height="30" align="left">
									<%=songs.get(j).getSongArtist()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=songs.get(j).getSongPrice()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=album.get(i).getAlbumTitle()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=album.get(i).getAlbumArtist()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=album.get(i).getAlbumGenre()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=album.get(i).getAlbumPublisher()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=album.get(i).getAlbumPrice()%>&nbsp;							  </td>
								<td height="30" align="left">
									<%=album.get(i).getAlbumDate()%>&nbsp;							  </td>
									
			    			</tr>
						<%
						}
					}else if(request.getAttribute("mainSearchType").equals("A")){
						//resultAlbum.add(album.get(i));
						count++;

					
					%>
						<tr align="left" valign="middle" class="fontSize" id="<%=count %>" >
							<td height="30">
								<%=count-111 %>&nbsp;						  </td>
							<td height="30">
								<input id="<%=count+1000 %>" type="checkbox" name="<%=album.get(i).getAlbumTitle() %>" onclick='uncheck()' value="<%=album.get(i).getAlbumTitle() %>"><%=album.get(i).getAlbumTitle() %></input>&nbsp;						  </td>
							<td height="30">
								<%=album.get(i).getAlbumArtist()%>&nbsp;						  </td>
							<td height="30">
								<%=album.get(i).getAlbumGenre()%>&nbsp;						  </td>
							<td height="30">
								<%=album.get(i).getAlbumPublisher()%>&nbsp;						  </td>
							<td height="30">
								<%=album.get(i).getAlbumPrice()%>&nbsp;						  </td>
							<td height="30">
								<%=album.get(i).getAlbumDate()%>&nbsp;						  </td>
				</tr>
				  <%}
					session.setAttribute("resultType",request.getAttribute("mainSearchType"));
					session.setAttribute("resultAlbum",album);
					session.setAttribute("resultSongs",resultSongs);
				}%>
				<td colspan=9>
				<input type="submit" value="PURCHASE" onclick="return haveChosenAlready()"></input>				</td>
								
			<%}else if(album!=null && album.size()==0){%>
				"Sorry, there are no songs or albums maches the search"
			<%}
		%>
		</form>
	</table>
</td>
  </tr>
</table>

</body>
</html>