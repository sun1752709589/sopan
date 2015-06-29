package servlet;

import ioutil.FinalStr;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class GoogleServlet extends HttpServlet {

	private static  Logger logger = Logger.getLogger(GoogleServlet.class );
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String pass=request.getParameter("pass");
		if(pass==null || pass.length()==0){
			pass="1";
		}
		if(key==null || key.length()==0){
			return;
		}
		String url="";
		if("1".equals(pass)){
			url="http://173.194.72.31/custom?hl=zh-CN&q="+key;
		}else{
			url="http://www.glgoo.com/search?q="+key;
		}
		PrintWriter out = response.getWriter();
		out.println(url);
        out.close();
        
        count(FinalStr.DAY_SEARCH);
        
        String ipaddr=request.getRemoteAddr();
       // String username=request.getLocalName();
	  //  String agent = request.getHeader("User-Agent"); 
        String searchinfo=ipaddr+"    engine=google"+pass+"	  key="+key;
        logger.info(searchinfo);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void count(String type){
    	ServletContext app=getServletContext();
    	int count;
    	if(type=="daysearch"){
    		count=(Integer) app.getAttribute("daysearch");
    		count++;
    		app.setAttribute("daysearch", count);
    	}else if(type=="dayvisit"){
    		count=(Integer) app.getAttribute("dayvisit");
    		count++;
    		app.setAttribute("dayvisit", count);
    	}else if(type=="allsearch"){
    		count=(Integer) app.getAttribute("allsearch");
    		count++;
    		app.setAttribute("allsearch", count);
    	}else{
    		count=(Integer) app.getAttribute("allvisit");
    		count++;
    		app.setAttribute("allvisit", count);
    	}
    }
}
