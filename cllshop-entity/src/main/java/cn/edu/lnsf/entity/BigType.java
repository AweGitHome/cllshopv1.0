package cn.edu.lnsf.entity;

import java.io.Serializable;
import java.util.List;


public class BigType implements Serializable {

    private Integer id;

    private String name;

    private Integer status;

    private List<SmallType> smallTypes;

    public List<SmallType> getSmallTypes() {
        return smallTypes;
    }

    public void setSmallTypes(List<SmallType> smallTypes) {
        this.smallTypes = smallTypes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}