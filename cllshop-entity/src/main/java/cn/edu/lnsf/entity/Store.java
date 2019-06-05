package cn.edu.lnsf.entity;

import java.util.Date;

public class Store {
    private Integer id;

    private String name;

    private Integer userid;

    private Date createtime;

    private Integer status;

    private String info;

    private String storepic;

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

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }

    public String getStorepic() {
        return storepic;
    }

    public void setStorepic(String storepic) {
        this.storepic = storepic == null ? null : storepic.trim();
    }
}