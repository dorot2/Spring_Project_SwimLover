package com.swimlover.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swimlover.domain.MemberVO;
import com.swimlover.dto.EmailDTO;
import com.swimlover.dto.LoginDTO;
import com.swimlover.service.CartService;
import com.swimlover.service.EmailService;
import com.swimlover.service.MemberService;
import com.swimlover.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {

	//주입작업
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	//MemberServiceImpl memberService = new MemberServiceImpl();
	
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	@Setter(onMethod_ = {@Autowired})
	private OrderService orderService;
	
	//주입작업. spring-security.xml의 "bCryptPasswordEncoder" bean 주입을 받음.
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	//주입작업
	@Setter(onMethod_ = {@Autowired})
	private EmailService emailService;
	
	// 회원가입폼
	@GetMapping("/join")
	public void join() {
		log.info("회원가입 폼");
	}
	
	//회원정보저장
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) {
		
		//평문텍스트 비밀번호 --> 암호화
		// 1234 --> 암호화(60byte)
		String cryptEncoderPw = passwordEncoder.encode(vo.getMem_pw());
		
		vo.setMem_pw(cryptEncoderPw);
		
		// 개인정보 수집 
		// <input type = "checkbox"> 체크하지 않으면 정보가 전송되지 않아 null 처리가 됨
		if(vo.getMem_accept_info() != null && vo.getMem_accept_info().equals("on")) {
			vo.setMem_accept_info("Y");
		}else {
			vo.setMem_accept_info("N");
		}
		
		// 이메일
		// <input type = "checkbox"> 체크하지 않으면 정보가 전송되지 않아 null 처리가 됨(2)
		if(vo.getMem_accept_e() != null && vo.getMem_accept_e().equals("on")) {
			vo.setMem_accept_e("Y");
		}else {
			vo.setMem_accept_e("N");
		}	
		memberService.join(vo);
		
		return "redirect:/member/login";
	}
	
	// 아이디 중복체크
	@ResponseBody// ajax 요청(비동기)일 경우 사용
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(@RequestParam("mem_id") String mem_id) {
		ResponseEntity<String> entity = null;
		
		String isUseID = "";
		if(memberService.idCheck(mem_id) != null) {
			isUseID = "no"; // 아이디가 사용중
		}else {
			isUseID = "yes"; // 아이디 없음(사용가능)
		}
		
		entity = new ResponseEntity<String>(isUseID, HttpStatus.OK);
		
		return entity;
	}
	
	// 로그인 폼
	@GetMapping("/login")
	public void login() {
		log.info("로그인 폼");
	}
	
	// 로그인 인증
	@PostMapping("/loginPost")
	public String loginPost(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
		
		//로그인정보 인증작업
		MemberVO vo = memberService.login_ok(dto.getMem_id());
		
		String url = "";
		String msg = "";
		
		if(vo != null) {	//아이디가 일치함.
			String passwd = dto.getMem_pw(); //사용자가 입력한 비밀번호
			String db_passwd = vo.getMem_pw(); // DB에서 가져온 암호화된 비밀번호
			
			if(passwordEncoder.matches(passwd, db_passwd)) { // 비번이 일치됨.
				
				//로그인 시간 업데이트
				memberService.loginTimeUpdate(dto.getMem_id());
				session.setAttribute("loginStatus", vo);
				
				String dest = (String) session.getAttribute("dest");
				url = (dest != null) ? dest : "/";
				msg = "로그인이 되었습니다.";
			}else { // 비번이 일치되지 않음
				url = "/member/login";
				msg = "비번이 일치하지 않습니다.";
			}
		}else {	// 아이디가 일치하지 않음.
			url = "/member/login";
			msg = "아이디가 일치하지 않습니다.";
		}
		
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate(); // 세션 소멸
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다. 다음에 또 방문해주세요");
		
		return "redirect:/";
	}
	
	// 아이디, 비번찾기
	@GetMapping("/lostpass")
	public void lostpass() {
		
	}
	
	//아이디찾기
		@PostMapping("/searchID")
		public String searchID(@RequestParam("mem_name") String mem_name, @RequestParam("mem_email") String mem_email, 
								Model model, RedirectAttributes rttr) {
			
			log.info("이름: " + mem_name);
			log.info("전자우편: " + mem_email);
			
			String mem_id = memberService.searchID(mem_name, mem_email);
			
			String url = "";
			
			if(mem_id != null) {
				model.addAttribute("mem_id", mem_id); // key, value
				url = "/member/searchID"; // jsp파일이름
			}else {
				url = "redirect:/member/lostpass"; // 이동주소(get방식요청)
				rttr.addFlashAttribute("msg", "noID");
			}
			
			return url;		
		}
	
	
	//비번찾기 : 임시비밀번호 발급
	@PostMapping("/searchPw")
	public String searchPw(@RequestParam("mem_id") String mem_id, 
						   @RequestParam("mem_email") String mem_email,
						   RedirectAttributes rttr) 
	{
		
		
		//1.아이디와메일정보가 일치되는 지 존재유무 확인
		String db_mem_id = memberService.getIDEmailExists(mem_id, mem_email);
		String temp_pw = "";
		
		String url = "";
		String msg = "";
		
		if(db_mem_id != null) {
			
			//2. 임시비밀번호 생성
			UUID uid = UUID.randomUUID();
			
			log.info("임시비번: " + uid);
			
			temp_pw = uid.toString().substring(0, 6);  //6자리.
			
			
			
			// 3. 사용자의 회원정보 비밀번호를 암호화하여 DB에수정작업
			memberService.changePW(db_mem_id, passwordEncoder.encode(temp_pw));
			
			//4. 사용자에게 임시비밀번호 메일발송
			EmailDTO dto = new EmailDTO("SwimLover", "SwimLover", mem_email, "SwimLover 임시비밀번호 입니다.", "");
			
			try {
				emailService.sendMail(dto, temp_pw);
				url = "/member/login";
				msg = "임시 비밀번호가 메일로 발송되었습니다.";
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
		}else {
			url = "/member/lostpass";
			msg = "입력하신 정보가 일치하지 않습니다. 확인해주세요.";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@GetMapping("/confirmPW")
	public void confirmPW() {
		
	}
	
	@PostMapping("/confirmPW")
	public String confirmPW(@RequestParam("mem_pw") String mem_pw, HttpSession session, RedirectAttributes rttr) {
		
		//로그인 상태에서 세션을 통하여, 사용자 아이디를 참조할수가 있다.
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		MemberVO vo = memberService.login_ok(mem_id);
		
		String url = "";
		String msg = "";
		
		if(vo != null) {
			
			String db_passwd = vo.getMem_pw(); // DB에서 가져온 암호화된 비밀번호
			
			if(passwordEncoder.matches(mem_pw, db_passwd)) { // 비번이 일치됨.						
				url = "/member/modify";
			}else { // 비번이 일치되지 않음
				url = "/member/confirmPW";
				msg = "비번이 일치하지 않습니다.";
			}
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@GetMapping("/modify")
	public void modify(Model model, HttpSession session) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		MemberVO vo = memberService.login_ok(mem_id);
		
		model.addAttribute("memberVO", vo);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String enc_mem_pw = ((MemberVO) session.getAttribute("loginStatus")).getMem_pw();
		
		
		String url = "";
		String msg = "";
		
		// 비밀번호를 보안관점에서 다시 확인.
		if(passwordEncoder.matches(vo.getMem_pw(), enc_mem_pw)) {
			memberService.modify(vo);
			url = "/";
			msg = "회원정보수정 됨.";
		}else {
			url = "/member/modify";
			msg = "비밀번호 일치하지 않습니다.";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@GetMapping("/mypage")
	public void mypage(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		model.addAttribute("odr_totalPrice", memberService.getOrderTotalPrice(mem_id));
		model.addAttribute("cartProductCount", cartService.getCartProdutCountByUserID(mem_id));
		model.addAttribute("orderProcessCount", orderService.getOrderProcessCount(mem_id));
	}
	
	
}
