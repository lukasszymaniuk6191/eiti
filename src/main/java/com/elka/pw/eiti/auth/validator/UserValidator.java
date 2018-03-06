package com.elka.pw.eiti.auth.validator;

import com.elka.pw.eiti.auth.entity.User;
import com.elka.pw.eiti.auth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        String emailPattern= "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        Pattern pattern = Pattern.compile(emailPattern);
        if(!pattern.matcher(user.getEmail()).matches())
        {
            errors.rejectValue("email", "Email.userForm.email");
        }


        String phoneNumberPattern = "\\d{3}[-\\.\\s]\\d{3}[-\\.\\s]\\d{3}";
        pattern = Pattern.compile(phoneNumberPattern);
        if(!pattern.matcher(user.getPhoneNumber()).matches())
        {
            errors.rejectValue("phoneNumber", "PhoneNumber.userForm.email");
        }


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty");
    }
}