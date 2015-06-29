package ip;

import ioutil.FinalStr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class IPNewOldServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String logPath=FinalStr.COUNT_PATH+"\\";
		Set<String> today=new HashSet<String>();
		Set<String> history=new HashSet<String>();
		File dirCount=new File(logPath);
		if(dirCount.exists() && dirCount.isDirectory()){
			File[] logs=dirCount.listFiles();
			for(File log:logs){
				if(log.isFile()){
					String fName=log.getName();
					if("easysoso".equals(fName)){
						putInSet(today,log);
					}else if(fName.contains("easysoso") && fName.contains(".log")){
						putInSet(history,log);
					}
				}
			}
		}
		//
		Set<String> newaddip=new HashSet<String>();
		Set<String> oldvisitip=new HashSet<String>();
		int newipcount=0,oldipcount=0;
		for(String ip:today){
			if(history.contains(ip)){
				oldipcount++;
				oldvisitip.add(ip);
			}else{
				newipcount++;
				newaddip.add(ip);
			}
		}
		request.setAttribute("newipcount", newipcount);
		request.setAttribute("oldipcount", oldipcount);
		request.setAttribute("newaddip", newaddip);
		request.setAttribute("oldvisitip", oldvisitip);
		RequestDispatcher rd = request.getRequestDispatcher( "/admin/ipcount.jsp");
    	rd.forward(request,response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	private void putInSet(Set<String> set,File file){
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(file)));
			String str = null;
			 
			while((str = reader.readLine())!=null){
				String result=getIP(str);
				set.add(result);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	private String getIP(String source) {  
		String regex="\\b((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\b";
        String result = "";  
        Pattern pattern = Pattern.compile(regex);  
        Matcher matcher = pattern.matcher(source);  
        while (matcher.find()) {  
            result = matcher.group(1)+"."+matcher.group(2)+"."+matcher.group(3)+"."+matcher.group(4);
        }  
        return result;  
    }  
}
