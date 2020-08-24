package com.zte.zshop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.zshop.cart.ShoppingCart;
import com.zte.zshop.dao.ProductDAO;
import com.zte.zshop.entity.Product;
import com.zte.zshop.entity.ProductType;
import com.zte.zshop.params.ProductParam;
import com.zte.zshop.service.ProductService;
import com.zte.zshop.service.dto.ProductDto;
import com.zte.zshop.service.ftp.FTPConfig;
import com.zte.zshop.service.ftp.FtpUtils;
import com.zte.zshop.utils.StringUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Author:msy
 * Date:2020-05-28 14:29
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private FTPConfig ftpConfig;

    @Override
    public void add(ProductDto productDto) throws FileUploadException {

        //获取文件名,获取一个随机的文件名
        String fileName = StringUtils.renameFileName(productDto.getFileName());
        //获取文件上传路径
        //String filePath=productDto.getUploadPath()+"\\"+fileName;

        String picSavePath=StringUtils.generateRandomDir(fileName);
        //上传文件路径
        String filePath="";

        //长传文件
        try {
            //StreamUtils.copy(productDto.getInputStream(),new FileOutputStream(filePath));
            filePath=FtpUtils.pictureUploadByCaonfig(ftpConfig,fileName,picSavePath,productDto.getInputStream());

        } catch (IOException e) {
            //e.printStackTrace();
            throw new FileUploadException("文件上传失败："+e.getMessage());
        }

        Product product = new Product();
        try{
            //只能填充name,price
            PropertyUtils.copyProperties(product,productDto);
            //填充productType
            ProductType productType = new ProductType();
            productType.setId(productDto.getProductTypeId());
            product.setProductType(productType);
            //填充image
            product.setImage(filePath);


            productDAO.insert(product);
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    @Override
    public boolean checkName(String name) {
        Product product=productDAO.selectByName(name);
        if(product!=null){
            return false;
        }
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<Product> findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Product> products=productDAO.selectAll();
        PageInfo<Product> pageInfo = new PageInfo<>(products);

        return pageInfo;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Product findById(int id) {
        return productDAO.selectById(id);
    }

    @Override
    public void modifyProduct(ProductDto productDto) throws FileUploadException {

        //上传文件路径
        String filePath="";
        if(productDto.getFileName()!=null) {
            //获取文件名,获取一个随机的文件名
            String fileName = StringUtils.renameFileName(productDto.getFileName());
            //获取文件上传路径
            //String filePath=productDto.getUploadPath()+"\\"+fileName;

            String picSavePath = StringUtils.generateRandomDir(fileName);


            //长传文件
            try {
                //StreamUtils.copy(productDto.getInputStream(),new FileOutputStream(filePath));
                filePath = FtpUtils.pictureUploadByCaonfig(ftpConfig, fileName, picSavePath, productDto.getInputStream());

            } catch (IOException e) {
                //e.printStackTrace();
                throw new FileUploadException("文件上传失败：" + e.getMessage());
            }
        }

        Product product = new Product();
        try{
            //只能填充name,price
            PropertyUtils.copyProperties(product,productDto);
            //填充productType
            ProductType productType = new ProductType();
            productType.setId(productDto.getProductTypeId());
            product.setProductType(productType);
            if(productDto.getFileName()!=null) {
                //填充image
                product.setImage(filePath);
            }


            productDAO.update(product);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void removeProduct(int id) {

        productDAO.deleteById(id);

    }

    @Override
    /**
     * 获取图片，写到输出流
     * path:图片所在的物理路径
     * out:将图片写到一个流中
     */
    public void getImage(String path, OutputStream out) {
        try {
            StreamUtils.copy(new FileInputStream(path),out);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> findByParams(ProductParam productParam) {
        return productDAO.selectByParams(productParam);
    }

    @Override
    public boolean addToCart(int id, ShoppingCart sc) {

        Product product= productDAO.selectById(id);
        if(product!=null){
            sc.addProduct(product);
            return true;
        }
        return false;
    }

    //@Override
    //public void removeItemFromShoppingCart(ShoppingCart sc, int id) {
    //    sc.removeItem(id);
    //}

    @Override
    public void modifyItemQuantity(ShoppingCart sc, int id, int quantity) {
        sc.updateItemQuantity(id,quantity);
    }

    @Override
    public void clearShoppingCart(ShoppingCart sc) {
        sc.clear();
    }

    @Override
    public void removeItemsFromShoppingCart(ShoppingCart sc, int[] ids) {
        for (int id :ids){
            sc.removeItem(id);
        }

    }
}
