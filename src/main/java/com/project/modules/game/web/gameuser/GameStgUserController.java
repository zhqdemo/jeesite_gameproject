/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.web.gameuser;

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
import com.project.modules.game.entity.gameuser.GameStgUser;
import com.project.modules.game.service.gameuser.GameStgUserService;

/**
 * 用户Controller
 * @author 张青
 * @version 2018-03-06
 */
@Controller
@RequestMapping(value = "${adminPath}/game/gameuser/gameStgUser")
public class GameStgUserController extends BaseController {

	@Autowired
	private GameStgUserService gameStgUserService;
	
	@ModelAttribute
	public GameStgUser get(@RequestParam(required=false) String id) {
		GameStgUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameStgUserService.get(id);
		}
		if (entity == null){
			entity = new GameStgUser();
		}
		return entity;
	}
	
	@RequiresPermissions("game:gameuser:gameStgUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameStgUser gameStgUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameStgUser> page = gameStgUserService.findPage(new Page<GameStgUser>(request, response), gameStgUser); 
		model.addAttribute("page", page);
		return "modules/game/gameuser/gameStgUserList";
	}

	@RequiresPermissions("game:gameuser:gameStgUser:view")
	@RequestMapping(value = "form")
	public String form(GameStgUser gameStgUser, Model model) {
		model.addAttribute("gameStgUser", gameStgUser);
		return "modules/game/gameuser/gameStgUserForm";
	}

	@RequiresPermissions("game:gameuser:gameStgUser:edit")
	@RequestMapping(value = "save")
	public String save(GameStgUser gameStgUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameStgUser)){
			return form(gameStgUser, model);
		}
		gameStgUserService.save(gameStgUser);
		addMessage(redirectAttributes, "保存用户成功");
		return "redirect:"+Global.getAdminPath()+"/game/gameuser/gameStgUser/?repage";
	}
	
	@RequiresPermissions("game:gameuser:gameStgUser:edit")
	@RequestMapping(value = "delete")
	public String delete(GameStgUser gameStgUser, RedirectAttributes redirectAttributes) {
		gameStgUserService.delete(gameStgUser);
		addMessage(redirectAttributes, "删除用户成功");
		return "redirect:"+Global.getAdminPath()+"/game/gameuser/gameStgUser/?repage";
	}

}