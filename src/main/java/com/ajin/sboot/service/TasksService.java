package com.ajin.sboot.service;

import com.ajin.sboot.model.Tasks;
import org.springframework.data.domain.Page;

/**
 * Create By Japoul
 * 2019/4/1 12:45
 *
 * @author Japoul
 */
public interface TasksService {

    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    Tasks findById(Integer id);

    /**
     * 根据model进行分页查询
     *
     * @param pageNum
     * @param end
     * @param tasks
     * @return
     */
    Page<Tasks> findPageByModel(int pageNum, int end, Tasks tasks);

    /**
     * 删除/失效任务，使enable变为false即可，不实际删除
     *
     * @param id
     * @param userId
     */
    void deleteTask(Integer id, Integer userId);

    /**
     * 添加任务
     *
     * @param tasks
     * @return
     */
    boolean addTask(Tasks tasks);

    /**
     * 更改任务
     *
     * @param tasks
     * @return
     */
    boolean updateTask(Tasks tasks);
}
