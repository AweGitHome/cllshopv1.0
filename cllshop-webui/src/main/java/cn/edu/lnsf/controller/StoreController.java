package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Store;
import cn.edu.lnsf.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("store")
public class StoreController {

    private StoreService storeService;

    @Autowired
    public void setStoreService(StoreService storeService) {
        this.storeService = storeService;
    }

    @RequestMapping("register")
    @ResponseBody
    Map<String,Object> register(Store store){
        Map<String,Object> map = new HashMap<>();
        int index = storeService.storeRegister(store);
        if(index!=0){
            map.put("msg","入驻申请提交成功");
        }else{
            map.put("msg","入驻申请提交失败");
        }
        return map;
    }

    @RequestMapping("check")
    @ResponseBody
    Map<String,Object> checkStore(Store store){
        Map<String,Object> map = new HashMap<>();
        if(storeService.checkStoreIsExist(store)){
            map.put("msg","该店铺名已被注册");
        }else{
            map.put("msg","该店铺名可使用");
        }
        return map;

    }

    @RequestMapping("showStoreList")
    public String showProductsList(int curPage, HttpServletRequest request){
        PageBean pageInfo = storeService.getPageData(curPage);
        request.setAttribute("pageInfo",pageInfo);
        return "forward:/store.jsp";
    }

    @RequestMapping("showAudstoreList")
    public String showAudList(String curPage, HttpServletRequest request){
        if(curPage == null){
            curPage = "1";
        }
        int curpage = Integer.parseInt(curPage);
        PageBean pageInfo = storeService.getAudPageData(curpage);
        request.setAttribute("pageInfo",pageInfo);
        return "forward:/admin/jsp/auditing.jsp";
    }

    @RequestMapping("passRegister")
    @ResponseBody
    Map<String,Object> passRegister(Store store){
        Map<String,Object> map = new HashMap<>();
        map.put("msg","提交失败");
        if(storeService.passStoreRegi(store)!=0){
            map.put("msg","提交成功");
        }
        return map;
    }

    @RequestMapping("showStore")
    String showStore(HttpServletRequest request){
        List<Store> stores = storeService.getRegStore();
        request.setAttribute("stores",stores);
        return "forward:/store.jsp";
    }
}
