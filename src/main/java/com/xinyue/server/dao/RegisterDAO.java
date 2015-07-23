package com.xinyue.server.dao;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.model.Member;

public interface RegisterDAO {

	int saveMember(@Param("registerInfo")Member registerInfo);

	int findMemberByEmail(String email);

}
