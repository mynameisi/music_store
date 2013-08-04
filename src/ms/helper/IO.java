package ms.helper;
/*
 * this helper class aimed at IO assistantce
 */

import java.io.File;
import java.net.URL;

import background.MyBean;

public class IO {
	public static String getWebAppFolder(Class cls) {
		URL r = cls.getClassLoader().getResource(File.separator);
	    String filePath = r.getFile();
	    String webAppLoc=new File(filePath).getParentFile().getParent();
	    

		return webAppLoc;
	}

}
