package com.ajin.sboot.service.serviceImpl;

import com.ajin.sboot.dao.TasksRepository;
import com.ajin.sboot.model.Tasks;
import com.ajin.sboot.service.TasksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 * Create By Japoul
 * 2019/4/1 11:47
 *
 * @author Japoul
 */
@Service
public class TasksServiceImpl implements TasksService {

    @Autowired
    private TasksRepository tasksRepository;

    @Override
    public Tasks findById(Integer id) {
        return tasksRepository.findByIdAndEnable(id, true);
    }

    @Override
    public Page<Tasks> findPageByModel(int pageNum, int pageSize, Tasks tasks) {
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(pageNum, pageSize, sort);
        Page<Tasks> page = tasksRepository.findByStatusAndEnableAndUserID(tasks.getStatus(), tasks.getEnable(), tasks.getUserID(), pageable);
        return page;
    }

    @Override
    public void deleteTask(Integer id, Integer userId) {
        Tasks tasks = tasksRepository.findByIdAndEnable(id, true);
        if (tasks != null) {
            tasks.setId(id);
            tasks.setUserID(userId);
            tasks.setEnable(false);
            tasksRepository.save(tasks);
        }
    }

    @Override
    public boolean addTask(Tasks tasks) {
        if (tasks != null) {
            tasksRepository.save(tasks);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateTask(Tasks tasks) {
        if (tasks != null) {
            tasksRepository.save(tasks);
            return true;
        }
        return false;
    }

}
