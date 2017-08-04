package cn.fulong.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LongToTimeUtil {

	/**
     * 把毫秒转化成Timestamp
     * @param dateFormat(日期格式，例如：MM/ dd/yyyy HH:mm:ss)
     * @param millSec(毫秒数)
     * @return
     */
    public static Timestamp longToTimestamp(Long millSec){
    	String dateFormat = "yyyy-MM-dd HH:mm:ss";
    	SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
    	Date date= new Date(millSec);
     
    	Timestamp ts = new Timestamp(System.currentTimeMillis());
    	String tsStr = sdf.format(date);
		try {
			ts = Timestamp.valueOf(tsStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ts;
    }
    
    /**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Timestamp time = LongToTimeUtil.longToTimestamp(1474117711000L);
		System.out.println(time);
	}
	
}
