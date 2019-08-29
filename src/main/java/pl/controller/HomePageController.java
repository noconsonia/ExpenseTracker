package pl.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {

    @RequestMapping("/")
    public String index(){
        System.out.println("Looking for index.jsp");
        return "index";
    }

}
