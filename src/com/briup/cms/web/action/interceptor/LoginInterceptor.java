package com.briup.cms.web.action.interceptor;

import org.apache.struts2.ServletActionContext;

import com.briup.cms.common.exception.ServiceException;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;


public class LoginInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
		
	}

	@Override
	public void init() {
		
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception, ServiceException {
		 Object loginUser = ServletActionContext.getRequest().getSession().getAttribute("user");
		 	ServletActionContext.getResponse().setCharacterEncoding("UTF-8"); //设置编码格式
	        if(null == loginUser){  
	        	throw new ServiceException("请先登录，再访问后台");
	        }  
	        //通知struts2接着调用下一个拦截器或执行下一个Action（即：接着干下面的事情）
	        String resultCode = invocation.invoke();
	        
	        return resultCode;  
	}
	
}
