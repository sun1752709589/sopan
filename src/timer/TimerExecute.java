package timer;

import ioutil.Count;
import ioutil.FinalStr;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;

import servlet.SouSuo;

public class TimerExecute {
	private static  Logger logger = Logger.getLogger(TimerExecute.class );
	public static Timer timer=null;
	public static void execute24(final ServletContext app) {
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 22);
		cal.set(Calendar.MINUTE, 30);
		cal.set(Calendar.SECOND, 59);
		Date time=cal.getTime();
		if(timer==null){
			timer=new Timer();
		}
		
		timer.schedule(new TimerTask(){
			@Override
			public void run() {
				logger.info("one day execute");
				//Count.writeLog(getRealPath(FinalStr.LOG_PATH), new Date().toLocaleString()+"	one day once execute!");
				System.out.println("one day execute");
				//qing ling zhi qian xian tongbu yi ci
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
				//将这一天的访问量加入总访问量
				int daysearchtxttmp=Count.readTxt(getRealPath(FinalStr.DAY_SEARCH));
				int dayvisittxttmp=Count.readTxt(getRealPath(FinalStr.DAY_VISIT));
				int allsearchtxt=Count.readTxt(getRealPath(FinalStr.ALL_SEARCH));
				int allvisittxt=Count.readTxt(getRealPath(FinalStr.ALL_VISIT));
				Count.writeTxt(getRealPath(FinalStr.ALL_SEARCH), allsearchtxt+daysearchtxttmp);
				Count.writeTxt(getRealPath(FinalStr.ALL_VISIT), allvisittxt+dayvisittxttmp);
				app.setAttribute(FinalStr.ALL_SEARCH, allsearchtxt+daysearchtxttmp);
				app.setAttribute(FinalStr.ALL_VISIT, allvisittxt+dayvisittxttmp);
				//qing ling day
				app.setAttribute(FinalStr.DAY_SEARCH, 0);
				System.out.println("daysearch goto 0!");
				app.setAttribute(FinalStr.DAY_VISIT, 0);
				System.out.println("dayvisit goto 0!");
				Count.writeTxt(getRealPath(FinalStr.DAY_SEARCH), 0);
				Count.writeTxt(getRealPath(FinalStr.DAY_VISIT), 0);
			}
		}, time,1000*60*60*24);
	}
	
	public static void execute10(final ServletContext app) {
		
		Date time=new Date();
		time.setSeconds(59);
		if(timer==null){
			timer=new Timer();
		}
		timer.schedule(new TimerTask(){
			@Override
			public void run() {
				logger.info("10 minutes execute!");
				//Count.writeLog(getRealPath(FinalStr.LOG_PATH), new Date().toLocaleString()+"	10 minute once execute!");
				System.out.println("10 minutes execute!");
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
				//allsearch
				int daysearchmemapp=(Integer)app.getAttribute(FinalStr.DAY_SEARCH);
				int allsearchtxtapp=Count.readTxt(getRealPath(FinalStr.ALL_SEARCH));
				app.setAttribute(FinalStr.ALL_SEARCH, daysearchmemapp+allsearchtxtapp);
				//allvisit
				int dayvisitmemapp=(Integer)app.getAttribute(FinalStr.DAY_VISIT);
				int allvisittxtapp=Count.readTxt(getRealPath(FinalStr.ALL_VISIT));
				app.setAttribute(FinalStr.ALL_VISIT, dayvisitmemapp+allvisittxtapp);
			}
		}, time,1000*60*10);
	}
	
	public static String getRealPath(String fileName){
		return FinalStr.COUNT_PATH+"/"+fileName+".txt";
	}
}
