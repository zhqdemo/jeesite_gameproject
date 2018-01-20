/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.front.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.project.modules.front.entity.GameFrontUser;
import com.project.modules.front.service.GameFrontUserService;
import com.project.util.Constants;
import com.project.util.Encrypt;

/**
 * 前端用户Controller
 * @author 张青
 * @version 2018-01-14
 */
@Controller
@RequestMapping(value = "${adminPath}/front/gameFrontUser")
public class GameFrontUserController extends BaseController {

	@Autowired
	private GameFrontUserService gameFrontUserService;
	
	@ModelAttribute
	public GameFrontUser get(@RequestParam(required=false) String id) {
		GameFrontUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameFrontUserService.get(id);
		}
		if (entity == null){
			entity = new GameFrontUser();
		}
		return entity;
	}
	
	@RequiresPermissions("front:gameFrontUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameFrontUser gameFrontUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameFrontUser> page = gameFrontUserService.findPage(new Page<GameFrontUser>(request, response), gameFrontUser); 
		model.addAttribute("page", page);
		return "modules/front/gameFrontUserList";
	}

	@RequiresPermissions("front:gameFrontUser:view")
	@RequestMapping(value = "form")
	public String form(GameFrontUser gameFrontUser, Model model) {
		gameFrontUser.setPassword(Constants.UN_CHANGE_PASS);
		model.addAttribute("gameFrontUser", gameFrontUser);
		return "modules/front/gameFrontUserForm";
	}

	@RequiresPermissions("front:gameFrontUser:edit")
	@RequestMapping(value = "save")
	public String save(GameFrontUser gameFrontUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameFrontUser)){
			return form(gameFrontUser, model);
		}
		if(gameFrontUser.getPassword()!=null){
			if(gameFrontUser.getPassword().equals(Constants.UN_CHANGE_PASS)){
				gameFrontUser.setPassword(null);
			}else{
				gameFrontUser.setPassword(Encrypt.md5(gameFrontUser.getPassword()));
			}
		}else{
			gameFrontUser.setPassword(Encrypt.md5(""));
		}
		gameFrontUserService.save(gameFrontUser);
		addMessage(redirectAttributes, "保存用户成功");
		return "redirect:"+Global.getAdminPath()+"/front/gameFrontUser/?repage";
	}
	
	@RequiresPermissions("front:gameFrontUser:edit")
	@RequestMapping(value = "delete")
	public String delete(GameFrontUser gameFrontUser, RedirectAttributes redirectAttributes) {
		gameFrontUserService.delete(gameFrontUser);
		addMessage(redirectAttributes, "删除用户成功");
		return "redirect:"+Global.getAdminPath()+"/front/gameFrontUser/?repage";
	}

}