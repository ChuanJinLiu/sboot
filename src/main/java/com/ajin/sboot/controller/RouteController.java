package com.ajin.sboot.controller;

import com.ajin.sboot.model.Tasks;
import com.ajin.sboot.model.User;
import com.ajin.sboot.service.serviceImpl.TasksServiceImpl;
import com.ajin.sboot.status.TasksStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Japoul
 */
@Controller
public class RouteController {

    @Autowired
    private TasksServiceImpl tasksServiceImpl;

    /**
     * 跳转首页
     *
     * @return
     */
    @RequestMapping("/")
    public String home() {
        return "begin/home";
    }

    /**
     * 跳转登录界面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        User user = (User) request.getAttribute("user");
        if (user != null) {
            return "admin/index";
        }
        return "begin/login";
    }

    /**
     * 跳转首页2
     *
     * @return
     */
    @RequestMapping("/elements")
    public String elements() {
        return "begin/elements";
    }

    /**
     * 跳转首页3
     *
     * @return
     */
    @RequestMapping("/generic")
    public String generic() {
        return "begin/generic";
    }

    /**
     * 跳转后台主页
     *
     * @return
     */
    @RequestMapping("/index")
    public String index() {
        return "admin/index";
    }

    /**
     * 跳转近期任务界面
     *
     * @return
     */
    @RequestMapping("/immediateTasks")
    public String immediateTasksPage(@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum,
                                     @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, Model model, HttpServletRequest request) {
        Tasks tasks = new Tasks();
        tasks.setStatus(TasksStatus.IMMEDIATESTATUS);
        tasks.setEnable(true);
        User user = (User) request.getSession().getAttribute("user");
        tasks.setUserID(user.getId());
        Page<Tasks> page = tasksServiceImpl.findPageByModel(pageNum, pageSize, tasks);
        model.addAttribute("immediateTasksPage", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        return "admin/immediateTasks";
    }

    /**
     * 跳转已完成任务界面
     *
     * @return
     */
    @RequestMapping("/overTasks")
    public String overTasks(@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, Model model, HttpServletRequest request) {
        Tasks tasks = new Tasks();
        tasks.setStatus(TasksStatus.OVERSTATUS);
        tasks.setEnable(true);
        User user = (User) request.getSession().getAttribute("user");
        tasks.setUserID(user.getId());
        Page<Tasks> page = tasksServiceImpl.findPageByModel(pageNum, pageSize, tasks);
        model.addAttribute("overTasksPage", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        return "admin/overTasks";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "begin/login";
    }

}
