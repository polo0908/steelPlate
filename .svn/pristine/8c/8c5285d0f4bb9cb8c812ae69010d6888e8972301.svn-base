package com.yf.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


  

/**
 * 
 * 序列化操作工具类
 * @author yqy
 *
 */

public class SerializeUtil {
	
	
	/**
     * 将java对象转换成json字符串
     * @param object
     * @return
     */
    public static String ObjToJson(Object object) {
        JSONObject json = JSONObject.fromObject(object);
        return json.toString();
    }
 
    /**
     * 将List对象转换成json字符串
     * @param <T>
     * @param list
     * @return
     */
    public static <T> String ListToJson(List<T> list) {
        JSONArray jsonArray = JSONArray.fromObject(list);
        return jsonArray.toString();
    }
	
	/**
	 * json反序列化为对象,此实体中的属性不包括自定义的类型
	 * @param jsonStr
	 * @param clazz
	 * @return
	 */
	public static <T>Object JsonToObj(String jsonStr, Class<T> clazz) {
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);
        return JSONObject.toBean(jsonObject, clazz);
    }

	/**
	 * json反序列化为对象,此实体中的属性包括自定义的类型
	 * @param jsonStr
	 * @param clazz
	 * @param claasMap
	 * @return
	 */
	public static <T>Object JsonToObj(String jsonStr, Class<T> clazz,Map<Object, Object> claasMap) {
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);
        return JSONObject.toBean(jsonObject, clazz, claasMap);
    }
	
	
	/**
	 * json反序列化为对象集合
	 * @param jsonStr
	 * @param clazz
	 * @return
	 */
	public static <T>List<Object> JsonToList(String jsonStr, Class<T> clazz) {
        JSONArray jsonArray = JSONArray.fromObject(jsonStr);
        List<Object> list = new ArrayList<Object>();
        for (int i = 0; i < jsonArray.size(); i++) {
            list.add(JSONObject.toBean(jsonArray.getJSONObject(i), clazz));
        }
        return list;
    }
	
	/**
	 * json反序列化为对象集合对象,属性中包含实体类等; 如List<Student> 而Student中含有属性List<Teacher>
	 * @param jsonStr
	 * @param clazz
	 * @param classMap
	 * @return
	 */
	 public static <T> List<Object> JsonToList(String jsonStr, Class<T> clazz, Map<Object, Object> classMap) 
	    {  
	       JSONArray jsonArray = JSONArray.fromObject(jsonStr);  
	       List<Object> list = new ArrayList<Object>();  
	       for (int i = 0; i < jsonArray.size(); i++) {           
	           list.add(JSONObject.toBean(jsonArray.getJSONObject(i), clazz, classMap));  
	       }  
	       return list;  
	    }
	
	
	/**
	 * json反序列化为map集合
	 * @param jsonStr
	 * @return
	 */
	public static Map<Object, Object> JsonToMap(String jsonStr) {
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);
        Iterator<Object> it = jsonObject.keys();
        Map<Object, Object> map = new HashMap<Object, Object>();
        while (it.hasNext()) {
            String key = (String) it.next();
            Object value = jsonObject.get(key);
            map.put(key, value);
        }
        return map;
    }
	
	
	/**
     * json反序列化为数组
     * @param jsonStr
     * @return
     */
    public static Object[] JsonToObjArray(String jsonStr) {
        JSONArray jsonArray = JSONArray.fromObject(jsonStr);
        return jsonArray.toArray();
    }
	
    
    /**
     * json反序列化为字符串数组
     * @param jsonStr
     * @return
     */
    public static String[] JsonToStrArray(String jsonStr) {
        JSONArray jsonArray = JSONArray.fromObject(jsonStr);
        String[] stringArray = new String[jsonArray.size()];
        for (int i = 0; i < jsonArray.size(); i++) {
            stringArray[i] = jsonArray.getString(i);
        }
        return stringArray;
    }
    
    /**
     * json反序列化为Long类型数组
     * @param jsonStr
     * @return
     */
    public static Long[] JsonToLongArray(String jsonStr) {
 
        JSONArray jsonArray = JSONArray.fromObject(jsonStr);
        Long[] longArray = new Long[jsonArray.size()];
        for (int i = 0; i < jsonArray.size(); i++) {
            longArray[i] = jsonArray.getLong(i);
        }
        return longArray;
    }
    
    
    /**
     * json反序列化为Integer类型数组
     * @param jsonStr:[1,2,3,4]
     * @return
     */
    public static Integer[] JsonToIntegerArray(String jsonStr) {
        JSONArray jsonArray = JSONArray.fromObject(jsonStr);
        Integer[] integerArray = new Integer[jsonArray.size()];
        for (int i = 0; i < jsonArray.size(); i++) {
            integerArray[i] = jsonArray.getInt(i);
        }
        return integerArray;
    }
    


    
}
