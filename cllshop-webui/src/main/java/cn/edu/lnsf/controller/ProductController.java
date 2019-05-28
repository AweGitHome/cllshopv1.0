package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.PageBean;
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
import java.util.Map;
import java.util.UUID;

@Controller
public class ProductController {
    private ProductsService productsService;

    @Autowired
    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    @RequestMapping("showProList")
    public String showProductsList(int curPage, HttpServletRequest request){
        PageBean pageInfo = productsService.getPageData(curPage);
        request.setAttribute("pageInfo",pageInfo);
        return "forward:admin/productList.jsp";
    }

    @RequestMapping("uploadPic")
    @ResponseBody
    public Map<String,Object> uploadPic(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request){
        Map<String ,Object> map = new HashMap<>();
        try{
            if (file!=null) {// 判断上传的文件是否为空
                String path=null;// 文件路径
                String type=null;// 文件类型
                String fileName=file.getOriginalFilename();// 文件原名称
                System.out.println("上传的文件原名称:"+fileName);
                // 判断文件类型
                type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
                if (type!=null) {// 判断文件类型是否为空
                    if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())||"BMP".equals(type.toUpperCase())) {
                        // 项目在容器中实际发布运行的根路径
                        String realPath=request.getSession().getServletContext().getRealPath("/");
                        // 自定义的文件名称
                        String trueFileName= UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
                        // 设置存放图片文件的路径
                        path=realPath+"uploadProImg\\"+trueFileName;
                        System.out.println("存放图片文件的路径:"+path);
                        // 转存文件到指定的路径
                        file.transferTo(new File(path));
                        System.out.println("文件成功上传到指定目录下");
                        String picPath="http://localhost:8080/uploadProImg/"+trueFileName;
                        System.out.println("http://localhost:8080/uploadProImg/"+trueFileName);
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
}
