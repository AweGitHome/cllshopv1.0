package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.SmallType;
import cn.edu.lnsf.service.SmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("stype")
public class TypeController {
    @Autowired
    SmallTypeService smallTypeService;

    @RequestMapping("getAll")
    @ResponseBody
    List<SmallType> getStype(int bid){
        List<SmallType> smallTypeList = smallTypeService.findByBid(bid);
        return smallTypeList;
    }
}
