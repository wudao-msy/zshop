package com.zte.zshop.service.ftp;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Author:helloboy
 * Date:2020-06-13 14:37
 * Description:<描述>
 * 使用java代码完成将图片(二进制文件)上传到ftp指定目录
 */
public class Test {

    public static void main(String[] args) {

        testFTP();

    }

    private static void testFTP() {

        //创建客户端对象
        FTPClient ftp=new FTPClient();
        InputStream local=null;
        try {

            //连接ftp服务器
            ftp.connect("localhost",21);
            //登录
            ftp.login("mike","123");
            //设置上传路径
            String path="/2/3";
            //检查上传路径是否存在，如果不存在，返回false
            boolean flag= ftp.changeWorkingDirectory(path);
            //如果是false,创建上传路径
            if(!flag){
                //创建成功返回true,注意：该方法只能创建一级目录
                boolean b = ftp.makeDirectory(path);
                System.out.println("b----->"+b);

            }
            //指定上传路径
            ftp.changeWorkingDirectory(path);
            //指定上传文件的类型,如二进制文件
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            //读取本地文件
            File file = new File("d:\\Jellyfish.jpg");

            //设置本地输入流
            local= new FileInputStream(file);

            String name = file.getName();
            //设置字符集
            ftp.setControlEncoding("gbk");
            //将流写入ftp对应的目录
            boolean c = ftp.storeFile(name, local);
            System.out.println("c----->"+c);




        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                //关闭文件流
                local.close();
                //退出
                ftp.logout();
                //断开连接
                ftp.disconnect();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }




    }


}
