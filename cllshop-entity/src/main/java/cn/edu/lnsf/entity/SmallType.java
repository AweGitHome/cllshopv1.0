package cn.edu.lnsf.entity;

import java.io.Serializable;

public class SmallType implements Serializable {
    private Integer id;

    private String name;

    private Integer bigtype;

    private Integer status;

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

    public Integer getBigtype() {
        return bigtype;
    }

    public void setBigtype(Integer bigtype) {
        this.bigtype = bigtype;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}