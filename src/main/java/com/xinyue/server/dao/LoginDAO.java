package com.xinyue.server.dao;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.model.Member;

public interface LoginDAO {

	int findMemberByLoginInfo(@Param("loginInfo")Member loginInfo);

	int updateLoginTime(@Param("loginInfo")Member loginInfo);

}
