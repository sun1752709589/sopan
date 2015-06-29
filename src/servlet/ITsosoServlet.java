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

public class ITsosoServlet extends HttpServlet {

	private static Logger logger = Logger.getLogger(ITsosoServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String engine = request.getParameter("engine");
		String site = request.getParameter("site");
		String sotype = request.getParameter("sotype");
		String seltype=request.getParameter("seltype");
		String key = request.getParameter("key");
		if (site == null || site.length() == 0) {
			site="csdn";
		}
		if (seltype == null || seltype.length() == 0) {
			seltype="all";
		}
		if (key == null || key.length() == 0) {
			return;
		}
		PrintWriter out = response.getWriter();
		String url = "";
		if (engine.equals("two")) {
			url = getBaiduUrl(site, sotype,seltype, key);
			url = url + "~" + getGoogleUrl(site, sotype,seltype, key);
		} else if (engine.equals("baidu")) {
			url = getBaiduUrl(site, sotype, seltype, key);
		} else {
			url = getGoogleUrl(site, sotype,seltype,  key);
		}
		out.println(url);
		out.close();
		//记录访问量
		count(FinalStr.DAY_SEARCH);
		String ipaddr = request.getRemoteAddr();

		String searchinfo = ipaddr+"    engine=" + engine+"	sotype="+sotype+"	seltype="+seltype
				+ "	  site=" + site + "	  key=" + key;
		logger.info(searchinfo);
	}

	private String getGoogleUrl(String site,String sotype,String seltype,String key){
		ITBean bean=DBUtil.getITBean(site);
		StringBuilder sb=new StringBuilder();
    	sb.append("http://173.194.72.31/custom?hl=zh-CN");
    	sb.append(getStrBySelGoogle(bean,seltype));
    	sb.append("&q="+key);
    	return sb.toString();
	}
	private String getStrBySelGoogle(ITBean bean,String seltype){
    	StringBuilder sb=new StringBuilder();
    	if(seltype.equals("all")){
    		sb.append("&sitesearch="+bean.getSiteMain());
    	}else if(seltype.equals("blog")){
    		sb.append("&sitesearch="+bean.getSiteBlog());
    	}else if(seltype.equals("bbs")){
    		sb.append("&sitesearch="+bean.getSiteBbs());
    	}else if(seltype.equals("download")){
    		sb.append("&sitesearch="+bean.getSiteDownload());
    	}else if(seltype.equals("ask")){
    		sb.append("&sitesearch="+bean.getSiteAsk());
    	}else if(seltype.equals("news")){
    		sb.append("&sitesearch="+bean.getSiteNews());
    	}else{
    		sb.append("&sitesearch="+bean.getSiteMain());
    	}
    	return sb.toString();
    }
	private String getBaiduUrl(String site,String sotype,String seltype,String key){
		ITBean bean=DBUtil.getITBean(site);
		StringBuilder sb=new StringBuilder();
    	sb.append("http://www.baidu.com/s?ct=2097152");
    	sb.append(getStrBySelBaidu(bean,seltype));
    	sb.append("&wd="+key);
    	return sb.toString();
	}
	private String getStrBySelBaidu(ITBean bean,String seltype){
    	StringBuilder sb=new StringBuilder();
    	if(seltype.equals("all")){
    		sb.append("&si="+bean.getSiteMain());
    	}else if(seltype.equals("blog")){
    		sb.append("&si="+bean.getSiteBlog());
    	}else if(seltype.equals("bbs")){
    		sb.append("&si="+bean.getSiteBbs());
    	}else if(seltype.equals("download")){
    		sb.append("&si="+bean.getSiteDownload());
    	}else if(seltype.equals("ask")){
    		sb.append("&si="+bean.getSiteAsk());
    	}else if(seltype.equals("news")){
    		sb.append("&si="+bean.getSiteNews());
    	}else{
    		sb.append("&si="+bean.getSiteMain());
    	}
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
