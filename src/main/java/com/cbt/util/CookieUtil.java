package com.cbt.util;

/*import org.apache.commons.lang3.StringUtils;*/
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by fengzhiming on 16-8-5.
 */
public class CookieUtil {
    private static final Logger log = Logger.getLogger(CookieUtil.class);
    private static final String COOKIE_ENCODING = "UTF-8";
    /**
     * 设置cookie
     * @param response
     * @param name  cookie名字
     * @param value cookie值
     * @param maxAge cookie生命周期  以秒为单位
     */
    public static void addCookie(HttpServletResponse response,String name,String value,int maxAge) {
        try {
            value = URLEncoder.encode(value, COOKIE_ENCODING);
            Cookie cookie = new Cookie(name,value);
            cookie.setPath("/");
            if(maxAge>0)  cookie.setMaxAge(maxAge);
            response.addCookie(cookie);
        } catch (Exception e) {
            log.error("add cookie error!!!", e);
        }
    }

    /**
     * 根据名字获取cookie
     * @param request
     * @param name cookie名字
     * @return
     */
    public static Cookie getCookieByName(HttpServletRequest request,String name){
        Map<String,Cookie> cookieMap = ReadCookieMap(request);
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            return cookie;
        }else{
            return null;
        }
    }

    public static String getCookieValueByName(HttpServletRequest request,String name) {
        try {
            Cookie cookie = null;
            if ((cookie = getCookieByName(request, name)) != null) {
                String value = cookie.getValue();
                return StringUtils.isNotBlank(value) ? URLDecoder.decode(value, COOKIE_ENCODING) : value;
            }
        } catch (Exception e) {
            log.error("get Cookie Value error!!!", e);
        }
        return null;
    }

    /**
     * 编辑cookie
     * @param request
     * @return
     */
    public static void editCookie(HttpServletResponse response,HttpServletRequest request,String name,String value,int maxAge){
        Cookie cookie=getCookieByName(request,name);
        if(cookie!=null){
            cookie.setValue(value);
            cookie.setMaxAge(maxAge);
            response.addCookie(cookie);
        }
    }


    /**
     * 将cookie封装到Map里面
     * @param request
     * @return
     */
    private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){
        Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
        Cookie[] cookies = request.getCookies();
        if(null!=cookies){
            for(Cookie cookie : cookies){
                cookieMap.put(cookie.getName(), cookie);
            }
        }
        return cookieMap;
    }
 /*   A.用户登录前的数据流：用户在没有登录系统的时候，对喜欢的商品进行添加购物车，那么这个时候，我们可以把购物车信息保存

    到cookie中，这里会涉及到cookie的添加，修改操作；也即如果之前在cookie中不存对应的cookie，则就对cookie进行添加操作。

    如果在cookie中存在对应的cookie，那么，这时候，就要对cookie进行修改操作了(这里涉及到用户对同一个商品进行多次添加购物车的情况)。

    B.用户登录后的数据流：用户在登录后，系统首先做的第一件事就是去获取对应的cookies，如果存在相关的购物车cookies，那么就对该购物车

    信息进行相应用户User的持久化操作，要么添加，要么修改。（添加操作:该用户所对应的购物车如果没有相应的信息进行添加操作；修改操作：类似的，

    如果存在对应用户的购物车信息，就进行修改操作）。用户登录后，也可以进行购物车的添加操作，不过，这里不是添加到cookie中，而是直接持久化到

    数据库中。注：用户登录后的数据都是和数据库打交道。*/
}
