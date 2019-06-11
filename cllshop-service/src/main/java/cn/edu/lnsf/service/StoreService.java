package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Store;

import java.util.List;

public interface StoreService {
    /**
     * 店铺入驻
     * @param store
     * @return
     */
    int storeRegister(Store store);

    /**
     * 检查店铺名是否存在
     * @param store
     * @return
     */
    boolean checkStoreIsExist(Store store);

    /**
     * 获取所有店铺
     * @return
     */
    List<Store> getAllStore();
    PageBean getPageData(int curPage);
    List<Store> getAudStore();
    PageBean getAudPageData(int curPage);
    int passStoreRegi(Store store);
    List<Store> getRegStore();

}
