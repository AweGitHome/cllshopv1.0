package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("product")
public class ProductController {
    private ProductsService productsService;

    @Autowired
    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    @RequestMapping("showProList")
    public String showProductsList(String curPage, HttpServletRequest request){
        if(curPage==null){
            curPage = "1";
        }
        int curpage = Integer.parseInt(curPage);
        PageBean pageInfo = productsService.getPageData(curpage);
        request.setAttribute("pageInfo",pageInfo);
        return "forward:/admin/productList.jsp";
    }

    @RequestMapping("uploadPic")
    @ResponseBody
    public Map<String,Object> uploadPic(@RequestParam(value="file",required=false) MultipartFile file,HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        try{
            if (file!=null) {// 判断上传的文件是否为空
                String type=null;// 文件类型
                String fileName=file.getOriginalFilename();// 文件原名称
                System.out.println("上传的文件原名称:"+fileName);
                // 判断文件类型
                type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
                if (type!=null) {// 判断文件类型是否为空
                    if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())||"BMP".equals(type.toUpperCase())) {
                        String realPath=request.getSession().getServletContext().getRealPath("/");
                        String trueFileName= UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
                        // 设置存放图片文件的路径
                        String filePath=realPath+"uploadProImg\\"+trueFileName;
                        //System.out.println("存放图片文件的路径:"+filePath);
                        // 转存文件到指定的路径
                        file.transferTo(new File(filePath));
                        //System.out.println("文件成功上传到指定目录下");
                        String picPath="http://localhost:8080/uploadProImg/"+trueFileName;
                        //System.out.println("http://localhost:8080/uploadProImg/"+trueFileName);
                        map.put("pic",picPath);
                    }else {
                        System.out.println("不是我们想要的文件类型,请按要求重新上传");
                        return null;
                    }
                }else {
                    System.out.println("文件类型为空");
                    return null;
                }
            }else {
                System.out.println("没有找到相对应的文件");
                return null;
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        return map;
    }

    @RequestMapping("create")
    String createProd(Product product,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        if(productsService.addProduct(product)!=0){
            request.setAttribute("msg","添加成功");
            return "forward:/admin/product-add.jsp";
        }
        request.setAttribute("msg","添加失败");
        return "forward:/admin/product-add.jsp";
    }

    @RequestMapping("delBatch")
    @ResponseBody
    Map<String,Object> delProd(@RequestParam("ids[]") List<Integer> ids){
        Map<String,Object> map = new HashMap<>();
        map.put("msg","删除失败");
        if(productsService.batchDel(ids)){
            map.put("msg","删除成功");
        }
        return map;
    }
}
