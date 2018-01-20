package com.project.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.modules.front.entity.GameFrontUser;
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
			@RequestParam(required=false) String password,
			HttpServletRequest request		
			) {
		ResultBean result = new ResultBean();
		result.setCode(gameFrontUserService.login(account, password));
		if(result.getCode()==Error.ERR_SUCCESS){	
			//String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//+path+"/";
			GameFrontUser user = gameFrontUserService.getUserByAccount(account);
			if(user!=null&&user.getImg()!=null){
				if(user.getImg().startsWith("|")){
					user.setImg(basePath+user.getImg().substring(1, user.getImg().length()));
				}else{
					user.setImg(basePath+user.getImg());
				}
			}
			result.setData(user);
		}
		return result;
	}
}
