package com.ajin.sboot.model;


import javax.persistence.*;
import java.io.Serializable;

/**
 * Entity 中不映射成列的字段得加 @Transient 注解，不加注解也会映射成列
 *
 * @author Japoul
 */
@Entity
@Table(name="emp")
public class Emp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Long age;

    public Emp() {
    }

    public Emp(String name, Long age) {
        this.name = name;
        this.age = age;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getAge() {
        return age;
    }

    public void setAge(Long age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}