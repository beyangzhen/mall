package com.briup.cms.common.test;

import com.briup.cms.bean.Category;
import com.briup.cms.service.ICategoryService;
import com.briup.cms.service.impl.CategoryServiceImpl;

public class ServiceTest {
	public static void main(String[] args) {
		ICategoryService categoryService = new CategoryServiceImpl();
		Category category = new Category();
		category.setName("社会新闻");
		category.setCode(1001);
		categoryService.add(category);
		System.out.println("保存成功！");
	}
}
