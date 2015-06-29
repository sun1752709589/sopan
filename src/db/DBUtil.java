package db;

import entity.Bean;
import entity.ITBean;
import entity.SOType;
import entity.YunBean;

public class DBUtil {

	public static String[] its = {
		"1,csdn,csdn.net,blog.csdn.net,bbs.csdn.net,download.csdn.net,ask.csdn.net,news.csdn.net",
		"2,51cto,51cto.com,blog.51cto.com,bbs.51cto.com,down.51cto.com,book.51cto.com,news.51cto.com",
		"3,itpub,itpub.net,blog.itpub.net,itpub.net,wenku.it168.com,selftest.itpub.net,tech.it168.com",
		"4,chinaunix,chinaunix.net,blog.chinaunix.net,bbs.chinaunix.net,download.chinaunix.net,ask.chinaunix.net,selftest.chinaunix.net",
		"5,iteye,iteye.com,iteye.com/blogs,iteye.com/forums,iteye.com/magazines,iteye.com/ask,iteye.com/news"
	};
	
	public static String[] yuns={
		"1,baidu,pan.baidu.com",
		"2,jinshan,bbs.kuaipan.cn",
		"3,huawei,dl.dbank.com",
		"4,xuanfeng,fenxiang.qq.com",
		"5,weiyun,share.weiyun.com",
		"6,aiwen,ishare.iask.sina.com.cn",
		"7,sina,vdisk.weibo.com",
		"8,360,360.cn",
		"9,115,q.115.com",
		"10,xunlei,kuai.xunlei.com",
		"11,7958,7958.com",
		"12,chengtong,gxp.cc",
		"13,liyu,iliyu.com",
		"14,muchong,emuch.net",
		"15,xiaoshuo,qidian.com",
		"16,yingshi,youku.com",
		"17,wenxian,cnki.net",
		"18,dajia,topsage.com",
		"19,linuxpk,linuxpk.com",
		"20,javachina,java-cn.com",
		"21,it168,it168.com",
		"22,cnblogs,cnblogs.com",
		"23,tianji,yesky.com",
		"24,gameres,gameres.com",
		"25,csdnyun,yun.baidu.com",
		"26,qiannao,qiannao.com",//千脑网盘
		"27,box,box.net",//Box网盘
		"28,microsoft,skydrive.live.com",
		"29,lenovo,box.lenovo.com",
		"30,163,wp.163.com",
		"31,goukuai,gokuai.com",
		"32,xunleiyun,vip.xunlei.com",
		"33,gugu,51gugu.com",
		"34,qiming,shvns.com",
		"35,99,99pan.com",
		"36,yipan,gleasy.com",
	};
 	
 	public static String[] engine={};
 	public static String[] baike={
 		"1,baidu,baike.baidu.com",
 		"2,wiki,zh.wikipedia.org",
 		"3,hudong,baike.com",
 		"4,360,baike.so.com",
 		"5,mba,wiki.mbalib.com",
 		"6,soso,baike.sogou.com",
 		"7,soso,baike.sogou.com",
 		"8,zsku,zsku.net",
 		"9,chinabaike,chinabaike.com",
 	};
 	public static String[] tieba={
 		"1,baidu,tieba.baidu.com"
 	};
 	public static String[] blog={
 		"1,csdn,blog.csdn.net",
 		"2,51cto,blog.51cto.com",
 		"3,itpub,blog.itpub.net",
 		"4,chinaunix,blog.chinaunix.net",
 		"5,iteye,iteye.com/blogs",
 		"6,cnblogs,cnblogs.com",
 		"7,sina,blog.sina.com.cn",
 		"13,sohu,blog.sohu.com",
 		"8,163,blog.163.com",
 		"9,tianya,blog.tianya.cn",//天涯博客
 		"10,tengxun,blog.qq.com",
 		"11,blogchina,blogchina.com",//博客中国
 		"12,hexun,blog.hexun.com",//和讯博客
 	};
 	public static String[] weibo={
 		"1,sina,weibo.com",
 		"2,tengxun,t.qq.com",
 		"3,sohu,t.sohu.com",
 		"4,163,t.163.com",
 		"5,renren,renren.com",
 		"6,pengyou,pengyou.com",
 	};
 	public static String[] news={
 		"1,sina,news.sina.com.cn",
 		"2,baidu,news.baidu.com",
 		"3,hao123,news.hao123.com",
 		"4,qq,news.qq.com",
 		"5,sohu,news.sohu.com",
 		"6,163,news.163.com",
 		"7,ifeng,news.ifeng.com",
 		"8,chinanews,chinanews.com",
 		"9,xinhua,xinhuanet.com",
 		"10,cntv,cntv.cn",
 		"11,huanqiu,huanqiu.com",
 		"12,huaerjie,cn.wsj.com",//华尔街日报
 	};
 	public static String[] article={
 		"1,qidian,qidian.com",
 		"2,17k,17k.com",
 		"3,zongheng,zongheng.com",
 		"4,jjwxc,jjwxc.net",
 		"5,readnovel,readnovel.com",
 		"7,sinabook,book.sina.com.cn",
 		"8,xxsy,xxsy.net",
 		"9,douban,book.douban.com",
 		"10,dingdian,23us.com",//顶点小说
 		"11,hongxiu,hongxiu.com",
 		"13,motan,22mt.com",//墨坛文学
 		"14,yanqing,xs8.cn",//言情小说吧
 		"15,kanshu,kanshu.com",//看书网
 		"16,faloo,faloo.com",//飞卢中文网
 		"17,quanben,ybdu.com",//全本小说网
 		"18,qidianmm,qdmm.com",//起点mm
 	};
 	public static String[] video={
 		"1,baidu,v.baidu.com",
 		"2,youku,youku.com",
 		"3,tudou,tudou.com",
 		"4,sohu,tv.sohu.com",
 		"5,tengxun,v.qq.com",
 		"6,sina,video.sina.com.cn",
 		"7,aiqiyi,iqiyi.com",
 		"8,pptv,pptv.com",
 		"9,kankan,kankan.com",
 		"10,letv,letv.com",
 		"11,pps,pps.tv",
 		"12,fun,fun.tv",
 	};
 	public static String[] wenxian={
 		"1,wanfang,wanfangdata.com.cn",
 		"2,cnki,cnki.net",//中国知网
 		"3,qikan,jwedit.net",//
 		"4,cqvip,cqvip.com",//维普网
 		"5,paperonline,paper.edu.cn",//中国科技论文在线
 		"6,lunwentianxia,lunwentianxia.com",//论文天下
 		"7,kexuenet,sciencenet.cn",//科学网
 		"8,360lunwen,360lunwen.com",//360论文网
 	};
 	public static String[] bbs={
 		"1,tianya,tianya.cn",
 		"2,mop,mop.com",
 		"3,sohu,club.sohu.com",
 		"4,ifeng,bbs.ifeng.com",
 		"5,163,bbs.163.com",
 		"6,people,bbs1.people.com.cn",
 		"7,chinabbs,club.china.com",
 		"8,qqbbs,bbs.qq.com",
 		"9,xinhuabbs,forum.home.news.cn",
 		"10,cntv,bbs.cntv.cn",
 		"11,it168,bbs.it168.com",
 		"12,newsmth,newsmth.net",//水木社区
 		"13,chinaz,bbs.chinaz.com",//站长论坛
 		"14,csdn,bbs.csdn.net",//CDSN
 		"15,51cto,bbs.51cto.com",//51cto
 		"16,dajia,club.topsage.com",//大家论坛
 	};
 	public static String[] download={
 		"0,baidu,wenku.baidu.com",
 		"1,csdn,download.csdn.net",
 		"2,51cto,down.51cto.com",
 		"3,chinaunix,download.chinaunix.net",
 		"4,verycd,verycd.com",//电驴
 		"5,xuexi,xuexi111.com",//学习资料库
 		"6,xidong,xidong.net",//西东网
 		"7,eshuge,eshuge.net",//E书阁
 		"8,daxues,daxues.cn",//中国大学生
 		"9,gaokao,ks5u.com",//高考资源网
 	};
 	public static String[] image={};
 	public static String[] game={
 		"1,qqgame,games.qq.com",
 		"2,gamersky,gamersky.com",
 		"3,youxia,ali213.net",//游侠网
 		"4,gamechina,game.china.com",//游戏中国
 		"5,52pk,down.52pk.com",//52PK
 		"6,baidu,game.baidu.com",//百度
 		"7,pcgames,pcgames.com.cn",//太平洋游戏
 		"8,yxdown,yxdown.com",//游讯网
 		"9,17173,17173.com",//17173
 		"10,duowan,duowan.com",//多玩
 		"11,sina,games.sina.com.cn",//sina
 		"12,3dmgame,3dmgame.com",//3dm
 		"13,tgbus,tgbus.com",//电玩巴士
 	};
 	public static String[] work={};
 	public static String[] company={};
 	public static String[] software={
 		"1,sky,skycn.com",//天空下载
 		"3,crsky,crsky.com",//非凡软件站
 		"4,onlinedown,onlinedown.net",//华军软件
 		"5,cncrk,cncrk.com",//起点软件
 		"6,gpxz,gpxz.com",//谷普软件
 		"7,xiazaiba,xiazaiba.com",//下载吧
 		"8,baidu,rj.baidu.com",//百度软件中心
 		"9,sina,tech.sina.com.cn",//新浪软件中心
 		"10,pconline,pconline.com.cn",//太平洋下载
 		"2,xdowns,xdowns.com",//绿盟
 		"11,pchome,download.pchome.net",//pchome
 		"12,softpedia,softpedia.com",//softpedia
 		"13,enet,download.enet.com.cn",//enet
 		"14,drivers,myfiles.com.cn",//驱动之家
 		"15,yesky,yesky.com",//天极网
 	};
 	public static String[] apk={
 		"1,baidu,shouji.baidu.com",
 		"2,zol,sj.zol.com.cn",//ZOL
 		"3,mobilechina,app.cnmo.com",//手机中国
 		"4,360,zhushou.360.cn",//360
 		"5,wandoujia,wandoujia.com",//豌豆荚
 		"6,anzhi,anzhi.com",//安智市场
 		"7,xiaomi,app.mi.com",//小米市场
 		"8,pconline,pconline.com.cn",//pconline
 		"9,appbao,android.myapp.com",//应用宝
 	};
 	public static String[] music={
 		"1,kugou,kugou.com",
 		"2,kuwo,kuwo.cn",
 		"3,qq,y.qq.com",
 		"4,baidu,music.baidu.com",
 		"5,1ting,1ting.com",
 		"6,9sky,9sky.com",
 		"7,sougou,music.sogou.com",
 		"8,xiami,xiami.com",
 		"9,yy8844,yy8844.cn",//音乐巴士
 		"10,yymp3,yymp3.com",//YYMP3
 	};
 	public static String[] taobao={};
 	public static String[] food={};
 	public static String[] travel={};
 	public static String[] viewspot={};
 	public static String[] history={
 		"1,huanqiuhis,history.huanqiu.com",
 		"2,lishichunqiu,lishichunqiu.com",
 		"3,sinahis,history.sina.com.cn",
 		"4,panlong,lishi5.com",//盘龙历史
 		"5,fengyun,lishifengyun.com",//历史风云
 		"6,360his,hao.360.cn",//360历史
 		"7,look28,look28.com",//中国野史网 
 		"8,lsfyw,lsfyw.net",//历史风云网 
 		"9,sohuhis,history.sohu.com",//搜狐历史 
 		"10,people,history.people.com.cn",//人民网
 		"11,qqhis,history.news.qq.com",//
 		"12,tiexue,lishi.tiexue.net",//铁血历史
 		"13,cntv,history.cntv.cn",//央视历史频道
 		"14,ifeng,news.ifeng.com/history",//凤凰历史
 	};
 	public static String[] military={
 		"1,tiexue,tiexue.net",
 	};
	
	public static YunBean getYunBean(String site){
		int len=yuns.length;
		String[] yun=null;
		for(int i=0;i<len;i++){
			if(yuns[i].contains(site)){
				yun=yuns[i].split(",");
				break;
			}
		}
		if(yun==null){
			yun=yuns[0].split(",");
		}
		YunBean yunBean=new YunBean();
		yunBean.setId(yun[0]);
		yunBean.setSiteName(yun[1]);
		yunBean.setSiteUrl(yun[2]);
		return yunBean;
	}
	
	public static ITBean getITBean(String site){
		int len=its.length;
		String[] it=null;
		for(int i=0;i<len;i++){
			String[] arr=its[i].split(",");
			if(arr[1].equals(site)){
				it=arr;
				break;
			}
		}
		if(it==null){
			it=its[0].split(",");
		}
		ITBean itBean=new ITBean();
		itBean.setId(it[0]);
		itBean.setSiteName(it[1]);
		itBean.setSiteMain(it[2]);
		itBean.setSiteBlog(it[3]);
		itBean.setSiteBbs(it[4]);
		itBean.setSiteDownload(it[5]);
		itBean.setSiteAsk(it[6]);
		itBean.setSiteNews(it[7]);
		return itBean;
	}
	
	public static Bean getBean(String sotype,String site){
		if(sotype==null || sotype.length()==0){
			sotype="yun";
		}
		if(site==null || site.length()==0){
			site="baidu";
		}
		String[] beans=null;
        switch(SOType.getSOtype(sotype)){  
        case yun:  
              beans=yuns;
            break;  
        case blog:
        	beans=blog;
            break;  
        case baike:
        	beans=baike;
            break; 
        case video:
        	beans=video;
            break; 
        case article:
        	beans=article;
            break; 
        case software:
        	beans=software;
            break; 
        case music:
        	beans=music;
            break; 
        case game:
        	beans=game;
            break; 
        case news:
        	beans=news;
            break; 
        case weibo:
        	beans=weibo;
            break; 
        case tieba:
        	beans=tieba;
            break; 
        case bbs:
        	beans=bbs;
            break; 
        case download:
        	beans=download;
            break; 
        case wenxian:
        	beans=wenxian;
            break; 
        case image:
        	beans=image;
            break; 
        case apk:
        	beans=apk;
            break; 
        case history:
        	beans=history;
            break; 
        case military:
        	beans=military;
            break;
		default:
			beans=yuns;
			break; 
        }  
        Bean bean=new Bean();
        int len=beans.length;
		String[] beanArry=null;
		for(int i=0;i<len;i++){
			String[] arr=beans[i].split(",");
			if(arr[1].equals(site)){
				beanArry=arr;
				break;
			}
		}
		if(beanArry==null){
			beanArry=beans[0].split(",");
		}
		bean.setId(beanArry[0]);
		bean.setSiteName(beanArry[1]);
		bean.setSiteUrl(beanArry[2]);
		
		return bean;
	} 
}
