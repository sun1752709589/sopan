package servlet;

import ioutil.FinalStr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import db.DBUtil;
import entity.Bean;
import entity.ITBean;
import entity.YunBean;

public class EasysosoServlet extends HttpServlet {

	private static Logger logger = Logger.getLogger(EasysosoServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String engine = request.getParameter("engine");
		String site = request.getParameter("site");
		String sotype = request.getParameter("sotype");
		String key = request.getParameter("key");
		if (sotype == null || sotype.length() == 0) {
			sotype="yun";
		}
		if (site == null || site.length() == 0) {
			site="baidu";
		}
		if (key == null || key.length() == 0) {
			return;
		}
		PrintWriter out = response.getWriter();
		String url = "";
		if (engine.equals("two")) {
			if("yun".equals(sotype) && ("baidu".equals(site) || "csdnyun".equals(site))){
				url = getBaiduUrl(site, sotype, key);
			}else{
				url = getBaiduUrl(site, sotype, key);
			}
			
			url = url + "~" + getGoogleUrl(site, sotype, key);
		} else if (engine.equals("baidu")) {
			url = getBaiduUrl(site, sotype,  key);
		} else {
			url = getGoogleUrl(site, sotype,  key);
		}
		out.println(url);
		out.close();
		//记录访问量
		count(FinalStr.DAY_SEARCH);
		String ipaddr = request.getRemoteAddr();
		String searchinfo = ipaddr+ "    engine=" + engine+"	sotype="+sotype
				+ "		site=" + site + "	key=" + key;
		logger.info(searchinfo);
	}

	private String getGoogleUrl(String site,String sotype,String key){
		Bean bean=DBUtil.getBean(sotype, site);
		StringBuilder sb=new StringBuilder();
    	sb.append("http://209.85.228.22/custom?hl=zh-CN");
    	sb.append("&sitesearch="+bean.getSiteUrl());
    	sb.append("&q="+key);
    	return sb.toString();
	}
	
	private String getBaiduUrl(String site,String sotype,String key){
		Bean bean=DBUtil.getBean(sotype, site);
		StringBuilder sb=new StringBuilder();
    	sb.append("http://www.baidu.com/s?ct=2097152");
    	sb.append("&si="+bean.getSiteUrl());
    	sb.append("&wd="+key);
    	return sb.toString();
	}
	private String getSouGouUrl(String site,String sotype,String key){
		Bean bean=DBUtil.getBean(sotype, site);
		StringBuilder sb=new StringBuilder();
    	sb.append("http://www.sogou.com/web?");
    	sb.append("&site="+bean.getSiteUrl());
    	sb.append("&query="+key);
    	return sb.toString();
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
