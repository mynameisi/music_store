package ms.helper;

import java.io.File;
import java.net.URL;

public class IO {
	public static String getWebAppFolder(Class cls) {
		URL r = cls.getClassLoader().getResource(File.separator);
	    String filePath = r.getFile();
	    String webAppLoc=new File(filePath).getParentFile().getParent();
		return webAppLoc;
	}

}
