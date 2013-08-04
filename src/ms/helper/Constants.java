/**
 * this class serves as the static content holder
 * 
 */
package ms.helper;

import java.io.File;
import java.net.URL;

public final class Constants {
	private Constants() {
	}

	public static String webAppPath = null;
	public static String songsXMLPath = null;
	static {
		/**
		 * the commented out area is a demonstration of the getResource method
		 */
		/*
		 * URL r1=Constants.class.getResource(".");
		 * System.out.println("url for res \" . \" is: "+r1);
		 * 
		 * URL r11=Constants.class.getResource("./IO.class");
		 * System.out.println("url for res \" ./IO.class \" is: "+r11);
		 * 
		 * URL r2=Constants.class.getResource("/");
		 * System.out.println("url for res \" / \" is: "+r2);
		 * 
		 * URL r3=Constants.class.getClassLoader().getResource("/");
		 * System.out.println
		 * ("url for res \" / \" is: "+r3+" [for classLoader]");
		 * 
		 * URL r = Constants.class.getClassLoader().getResource(File.separator);
		 */
		URL r = Constants.class.getResource("/");
		String filePath = r.getFile();
		webAppPath = new File(filePath).getParentFile().getParent();
		songsXMLPath = Constants.webAppPath + File.separator + "_res"
				+ File.separator + "Songs.xml";
	}
	/*
	 * public static void main(String[] args){ URL r =
	 * Constants.class.getClassLoader().getResource("."); System.out.println(r);
	 * }
	 */

}
