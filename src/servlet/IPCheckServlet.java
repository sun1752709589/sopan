package servlet;

import ioutil.FinalStr;
import ip.IPParser;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class IPCheckServlet extends HttpServlet {

	private static  Logger logger = Logger.getLogger(IPCheckServlet.class );
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
        response.setHeader("content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String self=request.getRemoteAddr();
        String username=request.getLocalName();
        String agent = request.getHeader("User-Agent"); 
        String other=request.getParameter("other");
        if(other==null || other.length()==0){
        	request.setAttribute("other", "null");
        	request.setAttribute("self", IPParser.getIPLocal(self));
        	logger.info(self+"=="+username+"	agent="+agent+"		click ipcheck");
        	RequestDispatcher rd = request.getRequestDispatcher( "/ipcheck.jsp");
        	rd.forward(request,response);
        	return;
        }
        if(!isIPAdress(other)){
        	request.setAttribute("other", "error");
        }else{
        	request.setAttribute("other", IPParser.getIPLocal(other));
        	request.setAttribute("checkedip", other);
        }
        request.setAttribute("self", IPParser.getIPLocal(self));
        count(FinalStr.DAY_SEARCH);
        logger.info(self+"=="+username+"	agent="+agent+"		check ip:"+other);
        RequestDispatcher rd = request.getRequestDispatcher( "/ipcheck.jsp");
    	rd.forward(request,response);
	}
	private boolean isIPAdress(String str)  
	{  
	    Pattern pattern = Pattern.compile( "^((\\d|[1-9]\\d|1\\d\\d|2[0-4]\\d|25[0-5]|[*])\\.){3}(\\d|[1-9]\\d|1\\d\\d|2[0-4]\\d|25[0-5]|[*])$" );  
	    return pattern.matcher(str).matches();  
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
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
	public static void main(String[] args) {
		
		//System.out.println(isIPAdress("121.28.32.206"));
	}
}
