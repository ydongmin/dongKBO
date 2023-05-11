package com.dong.KBO.domain;

import com.dong.KBO.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class GlobalValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("GlobalValidator.validate() is called");

        User user = (User)target;

        String id = user.getId();
        String pwd = user.getPwd();

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");

        if(id==null || id.length() <  4 || id.length() > 12) {
            errors.rejectValue("id", "invalidLength", new String[]{"4","12"}, null);
        }

        if(pwd==null || pwd.length() <  4 || pwd.length() > 12) {
            errors.rejectValue("pwd", "invalidLength", new String[]{"4","12"}, null);
        }
    }
}

