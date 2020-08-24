package com.zte.zshop.service;

import com.github.pagehelper.PageInfo;
import com.zte.zshop.cart.ShoppingCart;
import com.zte.zshop.entity.Product;
import com.zte.zshop.params.ProductParam;
import com.zte.zshop.service.dto.ProductDto;
import org.apache.commons.fileupload.FileUploadException;

import java.io.OutputStream;
import java.util.List;

/**
 * Author:msy
 * Date:2020-05-26 14:31
 * Description:<描述>
 */
public interface ProductService {
    public void add(ProductDto productDto) throws FileUploadException;

    public boolean checkName(String name);

    public PageInfo<Product> findAll(Integer pageNum, Integer pageSize);

    public Product findById(int id);

    public void modifyProduct(ProductDto productDto) throws FileUploadException;

    public void removeProduct(int id);

    public void getImage(String path, OutputStream out);

    public List<Product> findByParams(ProductParam productParam);

    public boolean addToCart(int id, ShoppingCart sc);

    //public void removeItemFromShoppingCart(ShoppingCart sc, int id);

    public void modifyItemQuantity(ShoppingCart sc, int id, int quantity);

    public void clearShoppingCart(ShoppingCart sc);

    public void removeItemsFromShoppingCart(ShoppingCart sc, int[] ids);
}
