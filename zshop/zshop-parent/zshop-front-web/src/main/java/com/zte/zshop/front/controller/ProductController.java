package com.zte.zshop.front.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.zshop.cart.ShoppingCart;
import com.zte.zshop.constants.Constant;
import com.zte.zshop.entity.Product;
import com.zte.zshop.entity.ProductType;
import com.zte.zshop.front.cart.ShoppingCartUtils;
import com.zte.zshop.params.ProductParam;
import com.zte.zshop.service.ProductService;
import com.zte.zshop.service.ProductTypeService;
import com.zte.zshop.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:msy
 * Date:2020-06-11 14:18
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/product")
public class ProductController {

    @Autowired
    private ProductTypeService productTypeService;

    @Autowired
    private ProductService productService;



    //初始化种类下拉列表
    @ModelAttribute("productTypes")
    public List<ProductType> loadProductTypes() {
        List<ProductType> productTypes = productTypeService.findEnable(Constant.PRODUCT_TYPE_ENABLE);
        return productTypes;

    }

    @RequestMapping("/main")
    public String main(ProductParam productParam,Integer pageNum,Model model) {

        if(ObjectUtils.isEmpty(pageNum)){
            pageNum=Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,4);
        List<Product> products=productService.findByParams(productParam);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("productParam",productParam);

        return "main";
    }

    @RequestMapping("/showPic")
    //将image路径对应的图片写回输出流(页面)
    public void showPic(String image,OutputStream out) throws IOException {
        //把http请求读取流
        URL url = new URL(image);
        URLConnection urlConnection = url.openConnection();
        InputStream is = urlConnection.getInputStream();
        BufferedOutputStream bos= new BufferedOutputStream(out);
        //建立缓冲池
        byte[] data=new byte[4096];
        int size=0;
        size=is.read(data);
        while(size!=-1){
            bos.write(data,0,size);
            size=is.read(data);
        }
        is.close();
        bos.flush();
        bos.close();
    }

    @RequestMapping("/toOrder")
    public String toOrder(){
        return "myOrders";
    }

    @RequestMapping("/toCart")
    public String toCart(){
        return "cart";
    }

    @RequestMapping("/toCenter")
    public String toCenter(){
        return "center";
    }


    @RequestMapping("/addToCart")
    @ResponseBody
    public ResponseResult addToCart(int id,HttpSession session){
        boolean flag=false;
        //获取购物车对象，从session中获取，如果没有，创建购物车
        ShoppingCart sc = ShoppingCartUtils.getShoppingCart(session);
        //完成将商品添加到购物车
        flag=productService.addToCart(id,sc);
        if(flag){
            //添加成功
            return ResponseResult.success("放入购物车成功");
        }
        //添加失败
        return ResponseResult.fail("放入购物车失败");


    }

   /* //删除订单
    @RequestMapping("/removeItemById")
    @ResponseBody
    public ResponseResult removeItemById(int id,HttpSession session){
        //获取购物车对象
        ShoppingCart sc = ShoppingCartUtils.getShoppingCart(session);
        productService.removeItemFromShoppingCart(sc,id);
        //如果购物车为空，到空页面，否则还到当前cart.jsp
        if(sc.isEmpty()){
            return ResponseResult.fail("购物车已空");
        }
        //重新计算总价
        Object totalMoney = sc.getTotalMoney();
        return  ResponseResult.success(totalMoney);

    }*/

    //更新商品数量
    @RequestMapping("/updateItemQuantity")
    @ResponseBody
    public Map<String,Object> updateItemQuantity(int id,int quantity,HttpSession session){
        //获取购物车对象
        ShoppingCart sc=ShoppingCartUtils.getShoppingCart(session);
        productService.modifyItemQuantity(sc,id,quantity);
        Map<String,Object> result=new HashMap<>();
        //获取单个商品总价
        result.put("itemMoney",sc.getProducts().get(id).getItemMoney());
        //获取购物车所有商品总价
        result.put("totalMoney",sc.getTotalMoney());
        return result;


    }

    //清空购物车
    @RequestMapping("/clear")
    @ResponseBody
    public ResponseResult clear(HttpSession session){
        //获取购物车对象
        ShoppingCart sc=ShoppingCartUtils.getShoppingCart(session);
        productService.clearShoppingCart(sc);
        return ResponseResult.success("清空购物车成功");
    }

    //批量删除
    @RequestMapping("/removeItemByIds")
    @ResponseBody
    public ResponseResult removeItemByIds(int[] ids,HttpSession session){
        //获取购物车
        ShoppingCart sc = ShoppingCartUtils.getShoppingCart(session);
        productService.removeItemsFromShoppingCart(sc,ids);
        if(sc.isEmpty()){
            return ResponseResult.fail("购物车已空");
        }
        //重新计价
        float totalMoney = sc.getTotalMoney();
        return ResponseResult.success("删除成功",totalMoney);


    }



}
