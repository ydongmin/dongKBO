package com.dong.KBO.controller;

import com.dong.KBO.domain.GlobalValidator;
import com.dong.KBO.dao.UserDao;
import com.dong.KBO.domain.User;
import com.dong.KBO.service.UserSha256;
import com.google.common.io.BaseEncoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserDao userDao;

    final int FAIL = 0;
    @Autowired
    JavaMailSender mailSender;

    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat df3 = new SimpleDateFormat("yyyyMMdd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df2, false));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df3, false));
        binder.setValidator(new GlobalValidator()); // GlobalValidator를 WebDataBinder의 로컬 validator로 등록
        //	List<Validator> validatorList = binder.getValidators();
        //	System.out.println("validatorList="+validatorList);
    }

    @GetMapping("/add")
    public String register() {
        return "registerForm"; // WEB-INF/views/registerForm.jsp
    }

    @PostMapping("/add")
    public String save(@Valid User user, BindingResult result, Model m, HttpServletRequest request, RedirectAttributes rattr) throws Exception {
        System.out.println("result="+result);
        System.out.println("user="+user);


        // User객체를 검증한 결과 에러가 있으면, registerForm을 이용해서 에러를 보여줘야 함.
        if(!result.hasErrors()) {
            // 2. DB에 신규회원 정보를 저장

            String encPassword = UserSha256.encrypt(user.getPwd()); // 비밀번호 암호화
            user.setPwd(encPassword);
            int rowCnt = userDao.insertUser(user);

                request.setAttribute("msg", "가입신청이 완료되었습니다.");
                request.setAttribute("url", "/KBO/login/login");

            if(rowCnt != FAIL) {
                return "redirect:/login/login";
//                return "registerInfo";
            }
        }

        return "registerForm";
    }

    // id 중복체크
    @PostMapping("/memberIdChk")
    @ResponseBody
    public String memberIdChK(String id) throws Exception {
//        logger.info("memberIdChk() 진입");

        int result = userDao.idCheck(id);

//        System.out.println("result = " + result);

        if(result != 0) {
            return "fail"; // 중복아이디 존재
        } else {
            return "success";
        }

    }

    //이메일 인증
    @ResponseBody
    @RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
    public String emailAuth(String email) {

        //뷰에서 넘어왔는지 확인
        System.out.println("이메일 전송");

        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;

        /* 이메일 보내기 */
        String setFrom = "pmj7206@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "인증 번호는 " + checkNum + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);

        }catch(Exception e) {
            e.printStackTrace();
        }

        return Integer.toString(checkNum);

    }

    private boolean isValid(User user) {
        return true;
    }


}