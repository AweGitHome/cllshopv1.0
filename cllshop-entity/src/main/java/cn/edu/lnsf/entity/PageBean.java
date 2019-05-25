package cn.edu.lnsf.entity;

import java.util.List;

public class PageBean {
    private List<?> data;
    private int curPage;
    private int prePage;
    private int nextPage;
    private int totalPage;
    private int firstPage = 1;
    private int totalCount;
    private int pageSize = 10;
    public List<?> getData() {
        return data;
    }
    public void setData(List<?> data) {
        this.data = data;
    }
    public int getCurPage() {
        return curPage;
    }
    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPrePage() {
        return this.curPage==1
                ?1
                :this.curPage-1;
    }
    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return this.curPage==this.totalPage
                ?this.getTotalPage()
                :this.curPage+1;
    }
    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getTotalPage() {
        return this.totalCount%this.pageSize==0
                ?this.totalCount/this.pageSize
                :this.totalCount/this.pageSize+1;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getFirstPage() {
        return firstPage;
    }
    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}

