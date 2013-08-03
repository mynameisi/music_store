package background;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchType=request.getParameter("searchType");
		String searchContent=this.validify(request.getParameter("searchContent"));
		String mainSearchType=request.getParameter("mainSearchType");		
		MyBean mybean=new MyBean();
		try{
			mybean.setAlbumList(searchType, searchContent,mainSearchType);
		}catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("Album", mybean.getAlbumList());//mybean.getAlbumList() returns the albums lists with the searching songs or albumns in it
		request.setAttribute("mainSearchType", mainSearchType);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("searchType", searchType);
		request.setAttribute("indicator", mybean.indicator);
		RequestDispatcher rd = request.getRequestDispatcher("SearchPage.jsp");//return to original search page
		rd.forward(request, response);
		
	}
	
	protected String validify(String v){
		v=v.trim();
		Pattern p=Pattern.compile(" {2,}");
		Matcher m=p.matcher(v);
		v=m.replaceAll(" ");
		return v;
	}

}
