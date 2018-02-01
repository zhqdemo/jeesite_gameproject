/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.zhq.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.project.modules.zhq.entity.ZhqCategory;
import com.project.modules.zhq.service.ZhqCategoryService;

/**
 * 分类信息Controller
 * @author 张青
 * @version 2018-02-01
 */
@Controller
@RequestMapping(value = "${adminPath}/zhq/zhqCategory")
public class ZhqCategoryController extends BaseController {

	@Autowired
	private ZhqCategoryService zhqCategoryService;
	
	@ModelAttribute
	public ZhqCategory get(@RequestParam(required=false) String id) {
		ZhqCategory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = zhqCategoryService.get(id);
		}
		if (entity == null){
			entity = new ZhqCategory();
		}
		return entity;
	}
	
	@RequiresPermissions("zhq:zhqCategory:view")
	@RequestMapping(value = {"list", ""})
	public String list(ZhqCategory zhqCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<ZhqCategory> list = zhqCategoryService.findList(zhqCategory); 
		model.addAttribute("list", list);
		return "modules/zhq/zhqCategoryList";
	}

	@RequiresPermissions("zhq:zhqCategory:view")
	@RequestMapping(value = "form")
	public String form(ZhqCategory zhqCategory, Model model) {
		if (zhqCategory.getParent()!=null && StringUtils.isNotBlank(zhqCategory.getParent().getId())){
			zhqCategory.setParent(zhqCategoryService.get(zhqCategory.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(zhqCategory.getId())){
				ZhqCategory zhqCategoryChild = new ZhqCategory();
				zhqCategoryChild.setParent(new ZhqCategory(zhqCategory.getParent().getId()));
				List<ZhqCategory> list = zhqCategoryService.findList(zhqCategory); 
				if (list.size() > 0){
					zhqCategory.setSort(list.get(list.size()-1).getSort());
					if (zhqCategory.getSort() != null){
						zhqCategory.setSort(zhqCategory.getSort() + 30);
					}
				}
			}
		}
		if (zhqCategory.getSort() == null){
			zhqCategory.setSort(30);
		}
		model.addAttribute("zhqCategory", zhqCategory);
		return "modules/zhq/zhqCategoryForm";
	}

	@RequiresPermissions("zhq:zhqCategory:edit")
	@RequestMapping(value = "save")
	public String save(ZhqCategory zhqCategory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, zhqCategory)){
			return form(zhqCategory, model);
		}
		zhqCategoryService.save(zhqCategory);
		addMessage(redirectAttributes, "保存分类信息成功");
		return "redirect:"+Global.getAdminPath()+"/zhq/zhqCategory/?repage";
	}
	
	@RequiresPermissions("zhq:zhqCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(ZhqCategory zhqCategory, RedirectAttributes redirectAttributes) {
		zhqCategoryService.delete(zhqCategory);
		addMessage(redirectAttributes, "删除分类信息成功");
		return "redirect:"+Global.getAdminPath()+"/zhq/zhqCategory/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<ZhqCategory> list = zhqCategoryService.findList(new ZhqCategory());
		for (int i=0; i<list.size(); i++){
			ZhqCategory e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}