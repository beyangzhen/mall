@Namespace("/manager")
@ParentPackage("default") //引用自己在struts.xml中写了拦截器的package

@InterceptorRefs(value={  // "/manager" 下的action都会被拦截
		@InterceptorRef(value="loginStack")
})
package com.briup.cms.web.action.manager;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
/**
 * 后台管理全局设定
 * 命名空间/manager
 * http://localhost:8080/cms/manager/toIndex.action
 * */
