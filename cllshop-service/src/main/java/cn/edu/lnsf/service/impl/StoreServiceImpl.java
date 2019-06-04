package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.StoreMapper;
import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.Store;
import cn.edu.lnsf.entity.StoreExample;
import cn.edu.lnsf.service.StoreService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
public class StoreServiceImpl implements StoreService {
    private StoreMapper storeMapper;

    @Autowired
    public void setStoreMapper(StoreMapper storeMapper) {
        this.storeMapper = storeMapper;
    }

    public int storeRegister(Store store) {
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String s = df.format(new Date());
            Date cT = df.parse(s);
            store.setCreatetime(cT);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (storeMapper.insertSelective(store) != 0){
            return 1;
        }
        return 0;
    }

    public boolean checkStoreIsExist(Store store) {
        StoreExample example = new StoreExample();
        example.createCriteria().andNameEqualTo(store.getName());
        List<Store> stores = storeMapper.selectByExample(example);
        if(stores!=null&&stores.size()>0){
            return true;
        }
        return false;
    }

    public List<Store> getAllStore() {
        StoreExample example = new StoreExample();
        example.createCriteria().andStatusEqualTo(1);
        List<Store> stores = storeMapper.selectByExample(example);
        return stores;
    }

    public PageBean getPageData(int curPage) {
        PageBean pageBean = new PageBean();
        PageHelper.startPage(curPage,pageBean.getPageSize());
        List<Store> list = getAllStore();
        //取分页信息
        PageInfo<Store> pageInfo = new PageInfo<Store>(list);
        long total = pageInfo.getTotal();
        pageBean.setData(list);
        pageBean.setTotalCount((int)total);
        pageBean.setCurPage(curPage);
        return pageBean;
    }
}
