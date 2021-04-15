package com.hsw.util;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName DateUtils
 * @Description TODO
 * @Author huangshengwen
 * @Date 2021/3/24 14:56
 * @Version 1.0
 **/

public class DateUtils {


    public static String getDateScope(String scope) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        String data = null;
        switch (scope) {
            case "week"://七天
                calendar.setTime(new Date());
                calendar.add(Calendar.DATE, 7);
                Date d = calendar.getTime();
                data = format.format(d);
                break;
            case "halfMonth"://半个月
                calendar.setTime(new Date());
                calendar.add(Calendar.DATE, 15);
                Date h = calendar.getTime();
                data = format.format(h);
                break;

            case "month"://一个月
                calendar.setTime(new Date());
                calendar.add(Calendar.MONTH, 1);
                Date m = calendar.getTime();
                data = format.format(m);
                break;

            case "threeMonth"://三个月
                calendar.setTime(new Date());
                calendar.add(Calendar.MONTH, 3);
                Date m3 = calendar.getTime();
                data = format.format(m3);
                break;

            case "halfYear"://半年
                calendar.setTime(new Date());
                calendar.add(Calendar.MONTH, 6);
                Date m6 = calendar.getTime();
                data = format.format(m6);
                break;

            case "year"://一年
                calendar.setTime(new Date());
                calendar.add(Calendar.YEAR, 1);
                Date y = calendar.getTime();
                data = format.format(y);
                break;
        }
        return data;
    }

    public static Map<String, String> getDateHHMMSSScope(String scope) {
        Map<String, String> dateMap = new HashMap<>();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        switch (scope) {
            case "10min"://十分钟前
                Date tenMinutes = new Date();
                calendar.setTime(tenMinutes);
                calendar.add(Calendar.MINUTE, -10);
                Date d = calendar.getTime();
                String min = format.format(d);
                dateMap.put("minDate", min);
                dateMap.put("maxDate", format.format(tenMinutes));
                break;

            case "1h"://一小时前
                Date oneHourDate = new Date();
                calendar.setTime(oneHourDate);
                calendar.add(Calendar.HOUR, -1);
                Date h = calendar.getTime();
                String halfMonth = format.format(h);
                dateMap.put("minDate", halfMonth);
                dateMap.put("maxDate", format.format(oneHourDate));
                break;

            case "3h"://三小时前
                Date hDate = new Date();
                calendar.setTime(hDate);
                calendar.add(Calendar.HOUR, -3);
                Date m = calendar.getTime();
                String mon = format.format(m);
                dateMap.put("minDate", mon);
                dateMap.put("maxDate", format.format(hDate));
                break;

            case "today"://今天
                buidDateScope(dateMap, 0);
                break;

            case "yesterday"://昨天
                buidDateScope(dateMap, -1);
                break;

            case "beforeyesterday"://前天
                buidDateScope(dateMap, -2);
                break;
        }
        return dateMap;
    }

    private static void buidDateScope(Map<String, String> dateMap, int day) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = new GregorianCalendar();
        calendar.add(Calendar.DATE, day);
        //一天的开始时间 yyyy:MM:dd 00:00:00
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        Date dayStart = calendar.getTime();
        String startStr = format.format(dayStart);
        //一天的结束时间 yyyy:MM:dd 23:59:59
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        Date dayEnd = calendar.getTime();
        String endStr = format.format(dayEnd);
        dateMap.put("minDate", startStr);
        dateMap.put("maxDate", endStr);
    }
}
