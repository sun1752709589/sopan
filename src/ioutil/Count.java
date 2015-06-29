package ioutil;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Count {

	public static void main(String[] args) {
//		String path = "d://allsearch.txt";
//		int tmp = readTxt(path);
//		System.out.println(tmp);
//		tmp++;
//		writeTxt(path, tmp);
//		System.out.println(readTxt(path));
	}

	public static void writeTxt(String path, int count) {
		BufferedWriter fw = null;
		try {
			File file = new File(path);
			fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, false), "UTF-8"));
			fw.append(""+count);
			fw.flush();
			} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static int readTxt(String path) {
		int count = 0;
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(path)));
			String str = null;
			str = reader.readLine();
			//System.out.println(str + "====");
			count = Integer.parseInt(str);
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
		return count;
	}

	public static void writeLog(String path, String info) {
		BufferedWriter fw = null;
		try {
			File file = new File(path);
			fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true), "UTF-8"));
			fw.append(""+info);
			fw.newLine();
			fw.flush();
			} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
