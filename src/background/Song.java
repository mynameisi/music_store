/**
 * 
 */
package background;

import java.util.*;

/**
 * @author mynameisi
 *
 */
public class Song {
	private String artist=null;
	private String title=null;
	private String price=null;
	
	Song(String title, String artist, String price){
		this.artist=artist;
		this.title=title;
		this.price=price;
	}
	
	public String getSongArtist(){
		return this.artist;
	}
	
	public String getSongTitle(){
		return this.title;
	}
	
	public String getSongPrice(){
		return this.price;
	}
	
	public Album getAlbum(ArrayList<Album> ab, String songTitle){
		for(int i=0;i<ab.size();i++){
			for(int j=0;j<ab.get(i).getAlbumSong().size();j++){
				if(songTitle.equals(ab.get(i).getAlbumSong().get(j).getSongTitle())){
					return ab.get(i);
				}
			}
		}
		return null;
	}

}
