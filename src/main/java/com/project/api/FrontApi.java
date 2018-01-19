package com.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.modules.front.service.GameFrontUserService;
import com.project.util.Error;
import com.project.util.ResultBean;
import com.thinkgem.jeesite.common.web.BaseController;
@Controller
@RequestMapping(value = "/api/front")
public class FrontApi extends BaseController {
	@Autowired
	private GameFrontUserService gameFrontUserService;
	
	@RequestMapping(value = "userlogin")
	public @ResponseBody ResultBean userLogin(
			@RequestParam(required=false) String account,
			@RequestParam(required=false) String password
			) {
		ResultBean result = new ResultBean();
		result.setCode(gameFrontUserService.login(account, password));
		if(result.getCode()==Error.ERR_SUCCESS){			
			result.setData(gameFrontUserService.getUserByAccount(account));
		}
		return result;
	}
}
