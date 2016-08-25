package com.briup.cms.service;

import java.util.List;

import com.briup.cms.bean.Article;

public interface IArticleService {
	void add(Article article);
	
	List<Article> list();
	
	void delete(long id);
	
	Article scanner(long id);
	
	List<Article> listByCategory(long c_id);

}
