package com.isaac.board.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Inject
	IMemberService service;

	@RequestMapping(value="member/list.do")
	public String memberList(Model model) {

		List<MemberVO> list = service.memberList();
		model.addAttribute("list", list);

		return "member/member_list";
	}

	@RequestMapping(value="member/write.do")
	public String form() {

		return "member/member_write";
	}

	@RequestMapping(value="member/insert.do")
	public String insertAction(@ModelAttribute MemberVO mvo) {

		service.insertMember(mvo);

		return "redirect:/member/list.do";
	}

	@RequestMapping(value="member/view.do")
	public String view(String userId, Model model) {

		model.addAttribute("dataBean", service.viewMember(userId));

		return "member/member_view";
	}

	@RequestMapping(value="member/update.do")
	public String updateAction(@ModelAttribute MemberVO mvo,  Model model) {

		int result = service.checkPw(mvo);
		if(result > 0) {
			service.updateMember(mvo);
			return "redirect:/member/list.do";
		}else {
			model.addAttribute("message", "비밀번호 불일치");
			model.addAttribute("dataBean", service.viewMember(mvo.getUserId()));
			return "member/member_view";
		}
	}

	@RequestMapping(value="member/delete.do")
	public String deleteAction(@ModelAttribute MemberVO mvo,  Model model) {
		int result = service.checkPw(mvo);
		if(result > 0) {
			service.deleteMember(mvo.getUserId());
			return "redirect:/member/list.do";
		}else {
			model.addAttribute("message", "비밀번호 불일치");
			model.addAttribute("dataBean", service.viewMember(mvo.getUserId()));
			return "member/member_view";
		}
	}
}
