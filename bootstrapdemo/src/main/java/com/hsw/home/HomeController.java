package com.hsw.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName HomeController
 * @Description TODO
 * @Author huangshengwen
 * @Date 2021/1/12 14:41
 * @Version 1.0
 **/
@Controller
@RequestMapping("/home")
public class HomeController {


    @RequestMapping("/index")
    public String index() {
        return "service/home/index";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "service/home/welcome";
    }
}
