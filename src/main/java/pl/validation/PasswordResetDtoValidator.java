package pl.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pl.DTO.PasswordResetDto;

@Component
public class PasswordResetDtoValidator implements Validator{

    @Override
    public boolean supports(Class clazz) {
        return PasswordResetDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {


        PasswordResetDto passwordResetDto = (PasswordResetDto) target;

        if(!(passwordResetDto.getPassword().equals(passwordResetDto.getConfirmPassword()))){
            errors.rejectValue("password", "Diff.userForm.passwordConfirm");
        }

    }

}