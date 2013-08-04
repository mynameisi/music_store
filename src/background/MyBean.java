/**
 * 
 */
package background;

//for ArrayList
import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import ms.helper.Constants;
import ms.helper.IO;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.sun.org.apache.xerces.internal.parsers.DOMParser;

/**
 * @author mynameisi
 *
 */
public class MyBean implements java.io.Serializable{
	private ArrayList<Album> albumList=new ArrayList<Album>();//the list of albums with the searching songs in it.
	private String mainSearchType=null;
	public int indicator=0;//use to indicate "searching for album but entered a song name"
	MyBean(){
		
	}
	public ArrayList<Album> getAlbumList(){
		return this.albumList;
	}
	//public void setAlbumList(ArrayList<Album> albumList){
	//	this.albumList=albumList;
	//}
	public void setAlbumList(String searchType, String searchContent, String mainSearchType) throws Exception{
		this.mainSearchType=mainSearchType;
		
		Album album=null;
		
		String AlbumTitle=null;
		String AlbumArtist=null;
		String Genre=null;
		Date Year=null;
		String Publisher=null;
		String Price=null;
		String date=null;
		Song song=null;
		ArrayList<Song> songs=new ArrayList<Song>();
		int numberOfSongs=0;
		
		String songArtist=null;
		String songTitle=null;
		String songPrice=null;
		
		//parsing the Songs.xml
		DOMParser parser = new DOMParser();
		
		//获得 WebContent/_res/Songs.xml 文件的相对路径
		
		Constants.webAppPath=IO.getWebAppFolder(this.getClass());
		Constants.songsXMLPath=Constants.webAppPath+File.separator+"_res"+File.separator+"Songs.xml";
		
		parser.parse(Constants.songsXMLPath);
		Document doc = parser.getDocument();
		NodeList list = doc.getElementsByTagName("*");
		if(searchType.equals("AlbumArtist") && mainSearchType.equals("S")){
			searchType="Artist";
		}
		
		//loop through everything in the XML file
	outer:for (int i=0; i<list.getLength(); i++) {
			String content1=list.item(i).getTextContent().toLowerCase();
			//if a child node is found
			if(list.item(i).getNodeName().equalsIgnoreCase(searchType) && content1.equalsIgnoreCase(searchContent)){		
				System.out.println("---------------------------------------------found one album: ");
				NodeList list2=null;
				if(searchType.equals("Title")){
					list2=list.item(i).getParentNode().getParentNode().getChildNodes();
					System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++list2.item(0).getNodeValue()= "+list2.item(0).getNodeValue());
					if(mainSearchType.equals("A")){
						indicator=1;
					}
					if(list2.item(1).getNodeName().equals("Album")){
						list2=list.item(i).getParentNode().getChildNodes();
						indicator=2;
					}
					
				}else{
					list2=list.item(i).getParentNode().getChildNodes();
				}
				
				if(searchType.equals("Artist")){
					list2=list.item(i).getParentNode().getParentNode().getChildNodes();
				}
				for(int j=0;j<list2.getLength();j++){
					String nodeName=list2.item(j).getNodeName();
					if(nodeName.equals("title")){
						AlbumTitle=list2.item(j).getTextContent();
						if(albumAlreadyAdded(AlbumTitle)){
							continue outer;
						}
						System.out.println("title="+AlbumTitle);
					}else if(nodeName.equals("AlbumArtist")){
						AlbumArtist=list2.item(j).getTextContent();
						System.out.println("AlbumArtist="+AlbumArtist);
					}else if(nodeName.equals("Genre")){
						Genre=list2.item(j).getTextContent();
						System.out.println("Genre="+Genre);
					}else if(nodeName.equals("Publisher")){
						Publisher=list2.item(j).getTextContent();
						System.out.println("Publisher="+Publisher);
					}else if(nodeName.equals("Price")){
						Price=list2.item(j).getTextContent();
						System.out.println("Price="+Price);
					}else if(nodeName.equals("Year")){
						date=list2.item(j).getTextContent();
						System.out.println("Date="+date);
					}else if(nodeName.equals("Song") && mainSearchType.equals("S")){
						NodeList list3=list2.item(j).getChildNodes();
						for(int k=0;k<list3.getLength();k++){
							String nodeName_1=list3.item(k).getNodeName();
							if(nodeName_1.equals("Title")){
								songTitle=list3.item(k).getTextContent();
								System.out.println("Song Title="+songTitle);
							}else if(nodeName_1.equals("Artist")){
								songArtist=list3.item(k).getTextContent();
							}else if(nodeName_1.equals("price")){
								songPrice=list3.item(k).getTextContent();
								System.out.println("songPrice="+songPrice);
							}
						}
						song=new Song(songTitle,songArtist,songPrice);
						songs.add(song);
						numberOfSongs++;
					}else if(nodeName.equals("Song") && !mainSearchType.equals("S")){
						songs=null;
					}
				}
				album=new Album(AlbumTitle,AlbumArtist,Genre,Publisher,Price,date,songs);
				
				//this is for later calculating discounted price
				album.addSongs(numberOfSongs);
				albumList.add(album);
				songs=new ArrayList<Song>();
				numberOfSongs=0;
			}
			
		}
	}
	
	public boolean albumAlreadyAdded(String albumTitle){
		for(int i=0;i<albumList.size();i++){
			if(albumList.get(i).getAlbumTitle().equalsIgnoreCase(albumTitle)){
				return true;
			}
		}
		return false;
	}
	
	
}
