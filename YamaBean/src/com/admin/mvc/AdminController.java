package com.admin.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.dto.BestMenuModel;
import com.admin.dto.OrderList;
import com.admin.dto.StoreOrdercondition;
import com.admin.dto.StoreSales;
import com.admin.dto.UpdateOrderYN;
import com.member.dto.Member;
import com.menu.dto.MenuModel;
import com.storeMap.dto.Store;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@Autowired
	private StoreOrderPageing pageing;

	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String AdminPage(Model model) {
		System.out.println("=== 관리자 페이지 ===");

		List<Store> StoreList = service.findByStore();
		List<BestMenuModel> bestMenu = service.findBestMenu();
		List<StoreSales> StoretotalSales = service.findtotalSales();

		model.addAttribute("StoreList", StoreList);
		model.addAttribute("bestMenu", bestMenu);
		model.addAttribute("StoretotalSales", StoretotalSales);

		System.out.println(bestMenu.toString());

		return "page";
	}

	@RequestMapping(value = "/stororder", method = RequestMethod.GET)
	public String storetotalSales(
			@ModelAttribute StoreOrdercondition condition, Model model) {
		System.out.println("=== stororder ===");

		System.out.println(condition.toString());

		List<Store> StoreList = service.findByStore();
		List<OrderList> orderList = service.findstoreOrder(condition);

		int totalpage = service.getOrderPageing(condition);

		int beginPage = pageing.getBeginPage(condition.getSelectPage());
		int endPage = pageing.getEndPage(totalpage);
		
		
		model.addAttribute("store_num", condition.getStore_num());
		model.addAttribute("StoreList", StoreList);
		model.addAttribute("selectPage", condition.getSelectPage());
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("orderList", orderList);

		return "stororder";
	}

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String AdminMemberPage(Model model) {
		System.out.println("=== 관리자 페이지 ===");

		List<Store> StoreList = service.findByStore();
		List<Member> memberList = service.findByMemberList();

		model.addAttribute("StoreList", StoreList);
		model.addAttribute("memberList", memberList);

		return "member";
	}

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String AdminMenuPage(Model model) {
		System.out.println("=== 관리자 페이지 ===");

		List<Store> StoreList = service.findByStore();
		List<MenuModel> menuList = service.findByMenuList();

		model.addAttribute("StoreList", StoreList);
		model.addAttribute("menuList", menuList);

		return "menu";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String AdminOrderPage(Model model, @RequestParam int store) {
		System.out.println("=== 관리자 페이지 ===");

		List<OrderList> orderList = service.orderList(store);
		model.addAttribute("orderList", orderList);

		List<Store> StoreList = service.findByStore();
		model.addAttribute("StoreList", StoreList);

		System.out.println(orderList.toString());

		return "order";
	}

	@RequestMapping(value = "/receipt", method = RequestMethod.GET)
	public String AdminOrderreceipt(@ModelAttribute UpdateOrderYN yn,
			Model model) {
		System.out.println("=== 물품수령 페이지 ===");

		int cnt = service.modifyOrder(yn);

		List<Store> StoreList = service.findByStore();
		model.addAttribute("StoreList", StoreList);

		System.out.println(yn.toString());

		String path = "redirect:/admin/order?store=" + yn.getStore();

		return path;
	}

}
