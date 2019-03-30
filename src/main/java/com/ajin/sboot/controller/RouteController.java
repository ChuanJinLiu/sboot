package com.ajin.sboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Japoul
 */
@Controller
public class RouteController {

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/elements")
    public String elements() {
        return "elements";
    }

    @RequestMapping("/generic")
    public String generic() {
        return "generic";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "admin";
    }
}
