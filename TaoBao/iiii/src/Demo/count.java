package Demo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class count {
	private Set<String> array = new HashSet<String>();

	//输出文件（把文件写入电脑）
	public boolean writ(Set<String> s,String g) {
		if(g!=null) {
			BufferedWriter bWriter=null;
			try {
				bWriter = new BufferedWriter(new FileWriter(new File("D:/eclipse/iiii/WebContent/Tao_Bao/Text/"+g+".txt")));
				for(String str : s) {
					//调用字符缓冲输出流对象的方法写数据
					bWriter.write(str);
					bWriter.newLine();
					}
				return true;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}finally {
				if (bWriter!=null) {
					try {
						bWriter.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}else
			return false;
	}
	//输入文件（把文件写入到网页）
	public Set<String> read(String g){
		if(g!=null) {
			BufferedReader bis = null;
			try {
				bis = new BufferedReader(new FileReader(new File("D:/eclipse/iiii/WebContent/Tao_Bao/Text/"+g+".txt")));
				String len;
				while ((len=bis.readLine())!= null) {
					array.add(len);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(bis!=null) {
					try {
						bis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return array;
	}
}
