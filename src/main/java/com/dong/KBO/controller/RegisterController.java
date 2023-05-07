package com.dong.KBO.controller;

import com.dong.KBO.domain.GlobalValidator;
import com.dong.KBO.dao.UserDao;
import com.dong.KBO.domain.User;
import com.dong.KBO.service.UserSha256;
import com.google.common.io.BaseEncoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserDao userDao;
    final int FAIL = 0;


    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
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
//            System.out.println("전 :" + encPassword);
            user.setPwd(encPassword);
//            System.out.println("후 : " + user.getPwd());
            int rowCnt = userDao.insertUser(user);

                request.setAttribute("msg", "가입신청이 완료되었습니다.");
                request.setAttribute("url", "/KBO/login/login");

            if(rowCnt != FAIL) {
//                return "redirect:/";
                return "registerInfo";
            }
        }

        return "registerForm";
    }

    private boolean isValid(User user) {
        return true;
    }


}