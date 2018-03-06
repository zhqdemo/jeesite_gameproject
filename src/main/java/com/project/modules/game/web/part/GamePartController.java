/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.web.part;

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
import com.project.modules.game.entity.part.GamePart;
import com.project.modules.game.service.part.GamePartService;

/**
 * 物品Controller
 * @author 张青
 * @version 2018-03-06
 */
@Controller
@RequestMapping(value = "${adminPath}/game/part/gamePart")
public class GamePartController extends BaseController {

	@Autowired
	private GamePartService gamePartService;
	
	@ModelAttribute
	public GamePart get(@RequestParam(required=false) String id) {
		GamePart entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gamePartService.get(id);
		}
		if (entity == null){
			entity = new GamePart();
		}
		return entity;
	}
	
	@RequiresPermissions("game:part:gamePart:view")
	@RequestMapping(value = {"list", ""})
	public String list(GamePart gamePart, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GamePart> page = gamePartService.findPage(new Page<GamePart>(request, response), gamePart); 
		model.addAttribute("page", page);
		return "modules/game/part/gamePartList";
	}

	@RequiresPermissions("game:part:gamePart:view")
	@RequestMapping(value = "form")
	public String form(GamePart gamePart, Model model) {
		model.addAttribute("gamePart", gamePart);
		return "modules/game/part/gamePartForm";
	}

	@RequiresPermissions("game:part:gamePart:edit")
	@RequestMapping(value = "save")
	public String save(GamePart gamePart, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gamePart)){
			return form(gamePart, model);
		}
		gamePartService.save(gamePart);
		addMessage(redirectAttributes, "保存物品成功");
		return "redirect:"+Global.getAdminPath()+"/game/part/gamePart/?repage";
	}
	
	@RequiresPermissions("game:part:gamePart:edit")
	@RequestMapping(value = "delete")
	public String delete(GamePart gamePart, RedirectAttributes redirectAttributes) {
		gamePartService.delete(gamePart);
		addMessage(redirectAttributes, "删除物品成功");
		return "redirect:"+Global.getAdminPath()+"/game/part/gamePart/?repage";
	}

}