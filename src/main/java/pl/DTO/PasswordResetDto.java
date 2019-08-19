package pl.DTO;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class PasswordResetDto {

    @Size(min = 4, message = "Please try one with at least 4 characters.")
    @NotBlank(message = "Please enter a password.")
    private String password;

    @Size(min = 4, message = "Please try one with at least 4 characters.")
    @NotBlank(message = "Please enter a password.")
    private String confirmPassword;

    @NotBlank
    private String token;

    private String username;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}