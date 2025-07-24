package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.Member;
import repository.MemberRepository;
import service.MemberService;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String main() {
        return "layout";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/home")
    public String home() {
        return "home";
    }
    

    @GetMapping("/register")
    public String registerForm() {
        return "register";
    }

    @PostMapping("/register")
    public String registerProcess(@ModelAttribute Member member, @RequestParam String confirmPassword, Model model, RedirectAttributes redirectAttributes) {
        if (!member.getPassword().equals(confirmPassword)) {
            model.addAttribute("error", "비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return "register";
        }
        memberService.join(member);
        redirectAttributes.addFlashAttribute("message", "회원가입에 성공했습니다.");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
