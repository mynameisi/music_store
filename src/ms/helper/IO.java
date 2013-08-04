package ms.helper;
/*
 * this helper class aimed at IO assistantce
 */

import java.io.File;
import java.net.URL;

public class IO {
	public static String getWebAppFolder() {
		URL r = IO.class.getClassLoader().getResource(File.separator);
	    String filePath = r.getFile();
	    String webAppLoc=new File(filePath).getParentFile().getParent();
	    

		return webAppLoc;
	}

}
