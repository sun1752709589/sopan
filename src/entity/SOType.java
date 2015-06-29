package entity;

public enum SOType {

	yun, it, blog,baike,video,article,software,music,game,news,weibo,
	tieba,bbs,download,wenxian,image,apk,history,military;

	public static SOType getSOtype(String sotype) {
		return valueOf(sotype.toLowerCase());
	}

	public static void main(String[] args) {
		//caseSOType("dog");
	}
}
