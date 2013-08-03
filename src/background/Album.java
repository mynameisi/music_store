/**
 * 
 */
package background;

//for Date
import java.util.*;

/**
 * @author mynameisi
 *
 */
public class Album {
	private String title=null;
	private String albumArtist=null;
	private String genre=null;
	private String publisher=null;
	private String price=null;
	private String date=null;
	private ArrayList<Song> songs=null;
	private int numberOfSongs=0;
	
	Album(String title, String albumArtist, String genre, String publisher, String price, String date, ArrayList<Song> songs){
		this.title=title;
		this.albumArtist=albumArtist;
		this.genre=genre;
		this.publisher=publisher;
		this.price=price;
		this.date=date;
		this.songs=songs;
	}
	
	public String getAlbumTitle(){
		return this.title;
	}
	public String getAlbumArtist(){
		return this.albumArtist;
	}
	public String getAlbumGenre(){
		return this.genre;
	}
	public String getAlbumPublisher(){
		return this.publisher;
	}
	public String getAlbumPrice(){
		return this.price;
	}
	public String getAlbumDate(){
		return this.date;
	}
	public ArrayList<Song> getAlbumSong(){
		return this.songs;
	}
	public void addSongs(int i){
		numberOfSongs=i;
	}
	public int getNumberOfSongs(){
		return this.numberOfSongs;
	}
	public float getSongPrices(){
		float songPrice=0;
		for(int i=0;i<songs.size();i++){
			songPrice+=Float.parseFloat(songs.get(i).getSongPrice());
		}
		return songPrice;
	}

}
