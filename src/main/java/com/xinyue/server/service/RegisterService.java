package com.xinyue.server.service;

import com.xinyue.manage.model.Member;

public interface RegisterService {

	boolean saveMember(Member registerInfo);

	boolean checkEmail(String email);

}
