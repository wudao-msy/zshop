package com.zte.level_46.front.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Author:msy
 * Date:2020-08-16 15:37
 * Description:<描述>
 */
public class AccessFilter implements Filter {
    //定义一个数组
    private String[] arr;


    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        String path = req.getServletPath();
        for(int i=0;i<arr.length;i++){
            //查看该服务器路径是否是需要屏蔽的路径，如果是，不执行过滤器
            if(path.equals("/"+arr[i])){
                //出过滤器
                chain.doFilter(request, response);
                return;
            }
        }
        //不是，就要查看是否已经登录
        HttpSession session = req.getSession(false);
        if(session==null||session.getAttribute("sysuser")==null){
            //请重新登录
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
            return;
        }
        //出过滤器
        chain.doFilter(request, response);

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
        //初始化urls,将其转化为数组
        String urls = filterConfig.getInitParameter("urls");
        //将字符串分割成数组
        arr = urls.split(",");

    }
}
