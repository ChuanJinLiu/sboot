package com.ajin.sboot.controller;

import com.ajin.sboot.model.Tasks;
import com.ajin.sboot.model.User;
import com.ajin.sboot.service.serviceImpl.TasksServiceImpl;
import com.ajin.sboot.status.TasksStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create By Japoul
 * 2019/4/1 12:13
 *
 * @author Japoul
 */
@Controller
public class TasksController {

    @Autowired
    private TasksServiceImpl tasksServiceImpl;

    @RequestMapping("/tasksDelete")
    public String tasksDelete(@RequestParam(value = "id") Integer id, HttpServletRequest request) {
        Integer pageNum = Integer.parseInt(request.getParameter("pageNum"));
        if (id != null) {
            User user = (User) request.getSession().getAttribute("user");
            if (user != null) {
                tasksServiceImpl.deleteTask(id, user.getId());
            }
        }
        return "redirect:/immediateTasks?pageNum=" + pageNum;
    }

    @RequestMapping("/addTasks")
    public HttpEntity<?> addTasks(@RequestParam(value = "name") String name, @RequestParam(value = "type") String type,
                                  @RequestParam(value = "planTime") String planTime, HttpServletRequest request) throws ParseException {
        Tasks tasks = new Tasks();
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            tasks.setName(name);
            tasks.setType(type);
            tasks.setStatus(TasksStatus.IMMEDIATESTATUS);
            tasks.setEnable(true);
            tasks.setUserID(user.getId());
            tasks.setCreateTime(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            tasks.setPlanTime(sdf.parse(planTime));
            boolean res = tasksServiceImpl.addTask(tasks);
            if (res) {
                return ResponseEntity.ok().build();
            }
        }
        return ResponseEntity.status(500).build();
    }

    /**
     * 获取选中信息进入编辑界面
     *
     * @param request
     * @return
     */
    @RequestMapping("/toUpdateTasks")
    public String toTasksUpdate(HttpServletRequest request, Model model) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Tasks tasks = tasksServiceImpl.findById(id);
        if (tasks != null) {
            model.addAttribute("tasks", tasks);
        }
        return "admin/tasksUpdate";
    }

    @RequestMapping("/updateTasks")
    public HttpEntity<?> updateTasks(@RequestParam(value = "name") String name, @RequestParam(value = "type") String type,
                                     @RequestParam(value = "id") Integer id, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            Tasks tasks = tasksServiceImpl.findById(id);
            if (tasks != null) {
                tasks.setId(id);
                tasks.setUserID(user.getId());
                tasks.setType(type);
                tasks.setName(name);
                boolean res = tasksServiceImpl.updateTask(tasks);
                if (res) {
                    return ResponseEntity.ok().build();
                }
            }
        }
        return ResponseEntity.status(500).build();
    }
}
