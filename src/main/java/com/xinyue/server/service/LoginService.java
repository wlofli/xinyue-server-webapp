package com.xinyue.server.service;

import com.xinyue.manage.model.Member;

public interface LoginService {

	boolean login(Member loginInfo);

	boolean updateLoginTime(Member loginInfo);

	Member getMemberInfo(Member loginInfo);

}
