package servlet;

import ioutil.Count;
import ioutil.FinalStr;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import timer.TimerExecute;
import db.DBUtil;
import entity.ITBean;
import entity.YunBean;

public class SouSuo extends HttpServlet {
	ServletContext app=null;
	private static  Logger logger = Logger.getLogger(SouSuo.class );
    @Override
	public void init() throws ServletException {
    	app=getServletContext();
    	FinalStr.COUNT_PATH=app.getRealPath("count"+"\\\\");
    	//同步访问量
    	app.setAttribute(FinalStr.DAY_SEARCH,Count.readTxt(getRealPath(FinalStr.DAY_SEARCH)));
    	app.setAttribute(FinalStr.DAY_VISIT, Count.readTxt(getRealPath(FinalStr.DAY_VISIT)));
    	app.setAttribute(FinalStr.ALL_SEARCH,Count.readTxt(getRealPath(FinalStr.ALL_SEARCH)));
    	app.setAttribute(FinalStr.ALL_VISIT, Count.readTxt(getRealPath(FinalStr.ALL_VISIT)));
    	
    	TimerExecute.execute24(app);
    	TimerExecute.execute10(app);
    	logger.info("sousuo servlet startup!");
    	//Count.writeLog(getRealPath(FinalStr.LOG_PATH), new Date().toLocaleString()+"	sousuo servlet startup!");
    	System.out.println("sousuo servlet startup!");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	request.setCharacterEncoding("UTF-8");
        response.setHeader("content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String engine=request.getParameter("engine");
        String site=request.getParameter("site");
        String sotype=request.getParameter("sotype");
        String seltype=request.getParameter("seltype");
        String key=request.getParameter("key");
        if(site==null || site.length()==0){
        	return;
        }
        PrintWriter out = response.getWriter();
        String url="";
        if(engine.equals("two")){
        	url=getBaiduUrl(site, sotype, seltype, key);
            url=url+"~"+getGoogleUrl(site, sotype, seltype, key);
        }else if(engine.equals("baidu")){
        	url=getBaiduUrl(site, sotype, seltype, key);
        }else{
        	url=getGoogleUrl(site, sotype, seltype, key);
        }
        //System.out.println("key:"+key);
        //System.out.println("url:"+url);
        out.println(url);
        out.close();
        count(FinalStr.DAY_SEARCH);
        
        String ipaddr=request.getRemoteAddr();
        String searchtime=new Date().toLocaleString();
        String searchinfo=ipaddr+"	"+searchtime+"    engine="+engine+"	site="+site+"	keyword="+key;
        logger.info(searchinfo);
        //Count.writeLog(getRealPath(FinalStr.LOG_PATH), searchinfo);
        //count("allsearch");
    }

    private String getGoogleUrl(String site,String sotype,String seltype,String key){
    	StringBuilder sb=new StringBuilder();
    	
    	sb.append("http://173.194.72.31/custom?hl=zh-CN");
    	if(sotype!=null && sotype.equals("it")){
    		site=site.substring(0,site.length()-2);
    		ITBean bean=DBUtil.getITBean(site);
    		sb.append(getStrBySelGoogle(bean,seltype));
    	}else{
    		site=site.substring(0,site.length()-3);
    		YunBean bean=DBUtil.getYunBean(site);
    		sb.append("&sitesearch="+bean.getSiteUrl());
    	}
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
    	StringBuilder sb=new StringBuilder();
    	sb.append("http://www.baidu.com/s?");
    	if(sotype!=null && sotype.equals("it")){
    		site=site.substring(0,site.length()-2);
    		ITBean bean=DBUtil.getITBean(site);
    		sb.append(getStrBySelBaidu(bean,seltype));
    	}else{
    		site=site.substring(0,site.length()-3);
    		YunBean bean=DBUtil.getYunBean(site);
    		sb.append("&si="+bean.getSiteUrl());
    	}
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
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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

	@Override
	public void destroy() {
		logger.info("sousuo servlet destory execute");
		 //Count.writeLog(getRealPath(FinalStr.LOG_PATH), new Date().toLocaleString()+"	sousuo servlet destory!");
		System.out.println("sousuo servlet destory execute");
		//daysearch
		int daysearchtxt=Count.readTxt(getRealPath(FinalStr.DAY_SEARCH));
		int daysearchmem=(Integer) app.getAttribute(FinalStr.DAY_SEARCH);
		if(daysearchmem<daysearchtxt){
			Count.writeTxt(getRealPath(FinalStr.DAY_SEARCH), daysearchtxt+daysearchmem);
			app.setAttribute(FinalStr.DAY_SEARCH, daysearchtxt+daysearchmem);
		}else{
			Count.writeTxt(getRealPath(FinalStr.DAY_SEARCH),daysearchmem);
		}
		//dayvisit
		int dayvisittxt=Count.readTxt(getRealPath(FinalStr.DAY_VISIT));
		int dayvisitmem=(Integer) app.getAttribute(FinalStr.DAY_VISIT);
		if(daysearchmem<daysearchtxt){
			Count.writeTxt(getRealPath(FinalStr.DAY_VISIT), dayvisittxt+dayvisitmem);
			app.setAttribute(FinalStr.DAY_VISIT, dayvisittxt+dayvisitmem);
		}else{
			Count.writeTxt(getRealPath(FinalStr.DAY_VISIT), dayvisitmem);
		}
		
		//stop timer
		if(TimerExecute.timer!=null){
			TimerExecute.timer.cancel();
			TimerExecute.timer=null;
			logger.info("stop timer successfuly!");
		}

	}
    
	private String getRealPath(String fileName){
		return FinalStr.COUNT_PATH+"\\"+fileName+".txt";
	}
}
