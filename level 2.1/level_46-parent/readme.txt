各层间的数据封装模型
页面(表单中的值)---->controller(VO)----->service(DTO)------>dao(pojo)


get请求中文乱码问题
我们这里用的字符编码过滤器只支持post请求
1：修改tomcat的server.xml
   在connector标签追加：URIEncoding="utf-8"
2：如果是tomcat插件：
   修改pom.xml
   <uriEncoding>utf-8</uriEncoding>

3:传值的2种方式
1：表单提交，通过元素的name属性传值  get(默认)/post(推荐)
2：url传值,get

表单提交
按钮为submit时，表单会被提交
如果使用js调用，使用ajax，不需要提交表单时，这时将提交表单的类型改为button类型即可

购物车对象实现原理
购物车对象：ShoppingCart.java,用于封装购物车列表集合(map)(service模块)
购物车明细对象:ShoppingCartItem.java,封装产品对象，数量属性(service模块)
购物车工具类：ShoppingCartUtils.java()(front-web模块)
该类用于调用方法，完成购物功能




