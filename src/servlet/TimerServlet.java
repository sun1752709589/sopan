package servlet;

import ioutil.Count;
import ioutil.FinalStr;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import timer.TimerExecute;

public class TimerServlet extends HttpServlet {

	ServletContext app=null;
	private static  Logger logger = Logger.getLogger(TimerServlet.class );
    @Override
	public void init() throws ServletException {
    	app=getServletContext();
    	FinalStr.COUNT_PATH=app.getRealPath("count"+"/");
    	//同步访问量
    	app.setAttribute(FinalStr.DAY_SEARCH,Count.readTxt(getRealPath(FinalStr.DAY_SEARCH)));
    	app.setAttribute(FinalStr.DAY_VISIT, Count.readTxt(getRealPath(FinalStr.DAY_VISIT)));
    	app.setAttribute(FinalStr.ALL_SEARCH,Count.readTxt(getRealPath(FinalStr.ALL_SEARCH)));
    	app.setAttribute(FinalStr.ALL_VISIT, Count.readTxt(getRealPath(FinalStr.ALL_VISIT)));
    	
    	TimerExecute.execute24(app);
    	TimerExecute.execute10(app);
    	logger.info("timer servlet startup");
    	System.out.println("timer servlet startup!");
	}
    @Override
	public void destroy() {
		logger.info("timer servlet destory");
		System.out.println("timer servlet destory execute");
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
		return FinalStr.COUNT_PATH+"/"+fileName+".txt";
	}
}
