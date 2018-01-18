package com.project.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.util.ResultBean;
import com.thinkgem.jeesite.common.web.BaseController;
@Controller
@RequestMapping(value = "${adminPath}/api/front")
public class FrontApi extends BaseController {
	@RequestMapping(value = "userlogin")
	public @ResponseBody ResultBean taglist() {
		ResultBean result = new ResultBean();
		return result;
	}
}
