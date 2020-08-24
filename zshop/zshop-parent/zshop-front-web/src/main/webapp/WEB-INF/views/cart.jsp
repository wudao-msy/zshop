<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>我的购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css"/>

    <script>
        $(function(){
            //使用ajax技术修改商品的数量
            //文本框内容发生更改时触发
            $(':text').change(function(){
                //alert(1);
                //获取文本框中原来的值
                let quantityVal= $.trim(this.value);
                //alert(quantityVal);
                let reg=/^\d+$/g;
                let quantity=-1;
                let flag=false;
                if(reg.test(quantityVal)){
                    //获取数量词
                    quantity=parseInt(quantityVal);
                    if(quantity>0){
                        flag=true;
                    }
                }
                //如果不是数字或者数字小于等于0，将原值赋予文本框
                if(!flag){
                    alert('输入的商品数量必须大于0');
                    //将该值之前最近的一次正确值写回文本框
                    $(this).val($(this).attr('class'));
                    return;

                }

                let $tr=$(this).parent().parent();
                let title=$.trim($tr.find("td:eq(2)").text());
                //弹出确认框
                //单击取消按钮
                if(!confirm("确定要修改["+title+"]的数量吗？")){
                    //将该值之前最近的一次正确值写回文本框
                    $(this).val($(this).attr('class'));
                    return;

                }
                //单击确定按钮
                else{
                    //将值重新写回class属性，确保class属性的值是最近正确的值
                    $(this).attr('class',$(this).val());
                }

                //使用ajax修改价格
                //1:请求地址
                let url='${pageContext.request.contextPath}/front/product/updateItemQuantity';
                //2:请求参数,使用json格式
                let idVal= $.trim(this.name);
                let args={"id":idVal,"quantity":quantityVal,"time":new Date()};

                //3:调用service相关方法修改
                //4:传回json数据
                //获取第二个td的值，也就是序号
                let item_count=$(this).parent().parent().find('td').eq(1).html();
                $.post(url,args,function(data){
                    //console.log(data.itemMoney);
                    let itemMoney=data.itemMoney;
                    let totalMoney=data.totalMoney;
                    //5:更新页面
                    //将这两个值写入页面对应元素
                    $('#totalMoney').html(totalMoney);
                    $('#itemMoney_'+item_count).html(itemMoney);


                });
            });

            //复选框全选全不选
            $('#all').click(function(){
                //alert(1);
                $('tr[id] input').prop('checked',$('#all').prop('checked'));

            });

            //批量删除
            $('#del').bind('click',function(){
                //alert(1);
                if($('tr[id] input:checked').length==0){
                    layer.msg('请选择需要删除的商品',{
                        time:2000,
                        skin:'errorMsg'
                    });
                }
                else{
                    //获取所有被选择的id

                    //找到所有被选中的行，一并删除
                    let ids=0;
                    $('tr[id] input:checked').each(function(){
                        //console.log(this.id);
                        ids+=this.id+',';
                    });
                    //console.log(ids.substr(0,ids.length-1));
                    ids=ids.substr(0,ids.length-1);
                    $.post('${pageContext.request.contextPath}/front/product/removeItemByIds',
                            {"ids":ids},function(result){
                                if(result.status==1){
                                    layer.msg('删除成功',{
                                        time:2000,
                                        skin:'successMsg'
                                    },function(){
                                        //将对应选中行删除
                                        $('table.table tr[id] input:checked').parent().parent().remove();
                                        //重新设置商品总价
                                        $('#totalMoney').html(result.data);


                                    });
                                }
                                else{
                                    layer.msg(result.message,{
                                        time:2000,
                                        skin:'errorMsg'
                                    },function(){
                                        //将对应选中行删除
                                        $('table.table tr[id] input:checked').parent().parent().remove();
                                        //将商品总价清0
                                        $('#totalMoney').html(0);

                                    });
                                }

                            });


                }


            });



        });

        //继续购物
        function shopping(){
            location.href='${pageContext.request.contextPath}/front/product/main';
        }

        //显示删除确认框
        function showModal(id,count){
            //alert(id);
            //将id存入模态框的隐藏表单域
            $('#deleteItemId').val(id);
            $('#count').val(count);
            //显示删除模态框
            $('#deleteItemModal').modal("show");

        }

        //删除订单
        function deleteItem(){
            $.post('${pageContext.request.contextPath}/front/product/removeItemByIds',
                    {"ids":$('#deleteItemId').val()},
                    function(result){
                        if(result.status==1){
                            layer.msg('删除成功',{
                                time:2000,
                                skin:'successMsg'
                            },function(){
                                //整个页面刷新
                                //location.href='${pageContext.request.contextPath}/front/product/toCart';
                                //局部页面刷新
                                let count=$('#count').val();
                                //找到该count对应的tr,将其删除即可
                                $('#id_'+count).remove();
                                //关闭删除确认框
                                $('#deleteItemModal').modal("hide");
                                //重新设置商品总价
                                $('#totalMoney').html(result.data);

                            });

                        }
                        else{
                            layer.msg(result.message,{
                                time:2000,
                                skin:'errorMsg'
                            },function(){
                                //整个页面刷新
                                //location.href='${pageContext.request.contextPath}/front/product/toCart';
                                //局部页面刷新
                                let count=$('#count').val();
                                //找到该count对应的tr,将其删除即可
                                $('#id_'+count).remove();
                                //重新设置总价
                                $('#totalMoney').html(0);
                                //关闭删除确认框
                                $('#deleteItemModal').modal("hide");


                            });


                        }
                    });
        }

        //清空购物车
        //函数名称这里不能是clear,clear默认是window对象下的一个函数
        function clearShoppingCart(){
            //alert(1);
            $.post('${pageContext.request.contextPath}/front/product/clear',
            function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //局部更新页面
                        //找到所有有id属性的tr
                        //console.log($('tr[id]').length);
                        $('tr[id]').remove();
                        //总价清0
                        $('#totalMoney').html(0);

                    });
                }

            });

        }

        //显示订单
        function showOrder(){
            //alert(1);
            location.href='${pageContext.request.contextPath}/front/order/showOrder';
        }

    </script>
</head>

<body>
<% request.setAttribute("index",2);%>
<jsp:include page="top.jsp"/>
<!-- content start -->
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>我的购物车</h3>
            </div>
        </div>
    </div>
    <table class="table table-hover table-striped table-bordered">
        <tr>
            <th>
                <input type="checkbox" id="all">
            </th>
            <th>序号</th>
            <th>商品名称</th>
            <th>商品图片</th>
            <th>商品数量</th>
            <th>商品单价</th>
            <th>商品总价</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${sessionScope.shoppingCart.items}" var="item" varStatus="s">
        <tr id="id_${s.count}">
            <td>
                <input type="checkbox" id="${item.product.id}">
            </td>
            <td>${s.count}</td>
            <td>${item.product.name}</td>
            <td> <img src="${pageContext.request.contextPath}/front/product/showPic?image=${item.product.image}" alt="" width="60" height="60"></td>

            <td>
                <input type="text" value="${item.quantity}" size="5" class="${item.quantity}" name="${item.product.id}">
            </td>
            <td><fmt:formatNumber type="number" value="${item.product.price}" pattern="#.00"/></td>
            <td id="itemMoney_${s.count}"><fmt:formatNumber type="number" value="${item.product.price * item.quantity}" pattern="#.00"/></td>
            <td>
                <button class="btn btn-success" type="button"> <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改</button>
                <button class="btn btn-danger" type="button" onclick="showModal(${item.product.id},${s.count})">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
                </button>
            </td>
        </tr>
        </c:forEach>
        <tr>
            <td colspan="8" align="right">
                <button class="btn btn-warning margin-right-15" type="button" id="del"> 删除选中项</button>
                <button class="btn btn-warning  margin-right-15" type="button" onclick="clearShoppingCart()"> 清空购物车</button>
                <button class="btn btn-warning margin-right-15" type="button" onclick="shopping()"> 继续购物</button>
                <a href="#">
                    <button class="btn btn-warning " type="button"  onclick="showOrder()"> 结算</button>
                </a>
            </td>
        </tr>
        <tr>
            <td colspan="8" align="right" class="foot-msg">
                总计： <b><span id="totalMoney"><fmt:formatNumber type="number" value="${shoppingCart.totalMoney}"
                                                               pattern="#.00"/></span> </b>元
            </td>
        </tr>
    </table>
</div>
<!-- content end-->
<!-- footers start -->
<div class="footers">
    版权所有：中兴软件技术
</div>
<!-- footers end -->

<!--删除确认框  start-->
<div class="modal fade" tabindex="-1" id="deleteItemModal">
    <input type="hidden" id="deleteItemId"/>
    <input type="hidden" id="count"/>
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->

        <input type="hidden" id="deleteProductId"/>
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body row">
                <div class="col-sm-8">
                    <h4>确认要删除该订单吗？</h4>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="deleteItem()">确认</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>

    </div>
</div>

<!--删除确认框  end-->

</body>

</html>
