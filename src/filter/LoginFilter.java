package filter;

import java.io.IOException;  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
public class LoginFilter extends HttpServlet implements Filter {  

	@Override
    public void doFilter(ServletRequest sRequest, ServletResponse sResponse,        
        FilterChain filterChain) throws IOException, ServletException{  
        HttpServletRequest request = (HttpServletRequest) sRequest;        
        HttpServletResponse response = (HttpServletResponse) sResponse;        
        //HttpSession session = request.getSession();        
        String url=request.getServletPath();
        if(url.equals("")) url+="/";    //防止空指针错误
        if(url.contains("/count") || url.contains("/admin")){//若访问后台资源 过滤到login    
            String passwd=sRequest.getParameter("passwd");
            if(passwd==null || passwd.length()==0 || !passwd.equals("suneasysoso")){
            	return;
            }
        }    
          filterChain.doFilter(sRequest, sResponse);      
    }

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}    
} 
