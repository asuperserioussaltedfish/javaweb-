<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/errorPage/ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>一条超正经的咸鱼</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            outline: none;
        }

        body {
            /*background: linear-gradient(45deg, rgb(107, 199, 207), rgb(52, 42, 79));*/
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .shell,
        form {
            position: relative;
        }

        .shell {
            display: flex;
            justify-content: center;
            transform: scale(0.994);
        }

        form {
            border-radius: 15px;
            width: 569px;
            height: 520px;
            background-color: #fff;
            box-shadow: 0px 15px 40px rgb(64,82,164);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #img-box {
            width: 368px;
            height: 520px;
            margin-left: -40px;
        }

        #img-box img {            border-radius: 15px;
            height: 100%;
        }

        #form-body {
            width: 320px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #welcome-lines {
            width: 100%;
            text-align: center;
            line-height: 1;
        }
        #w-line-1 {
            color: rgb(64, 97, 242);

            font-size: 50px;
        }

        #w-line-2 {
            color: rgb(43,69,180);
            font-size: 30px;
            margin-top: 17px;
        }

        #input-area {
            width: 100%;
        }
        .f-inp {
            position: relative;
            margin-top: 35px;
            width: 300px;
        }

        .f-inp input {
            position: relative;
            padding: 20px 10px 10px;
            background: transparent;
            outline: none;
            box-shadow: none;
            border: none;
            color: #8f8f8f;
            font-size: 1em;
            letter-spacing: 0.05em;
            transition: 0.5s;
            z-index: 10;
            width: 93%;
        }

        .f-inp::after {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 2px;
            background: rgb(43,69,180);
            border-radius: 4px;
            overflow: hidden;
            transition: 0.5s;
            pointer-events: none;
            z-index: 9;
            content: '';
        }

        .f-inp span {

            position: absolute;
            left: 0;
            padding: 20px 0px 10px;
            pointer-events: none;
            font-size: 1em;
            color: #5a5a5a;
            letter-spacing: 0.05em;
            transition: 0.5s;
        }

        .f-inp input:valid~span,
        .f-inp input:focus~span {

            color: rgb(43,69,180);
            transform: translateY(-34px);
            font-size: 0.75em;
        }

        .f-inp input:valid~::after ,
        .f-inp input:focus~::after{
            height: 44px;
        }
        #submit-button-cvr {
            margin-top: 20px;
        }

        #submit-button {
            display: block;
            width: 100%;
            color: #fff;
            font-size: 14px;
            margin: 0;
            padding: 14px 40px;
            border: 0;
            background-color: rgb(43,69,180);
            border-radius: 25px;
            line-height: 1;
            cursor: pointer;
        }

        #forgot-pass {
            text-align: center;
            margin-top: 10px;
        }

        #forgot-pass a {
            color: #868686;
            font-size: 12px;
            text-decoration: none;
        }
        .room{            border-radius: 15px;
            overflow: hidden;
            transform: scale(0.9);
            padding-left: 1.5px;
            padding-top: 1px;
            padding-bottom: 1px;
        }
        .room::before ,.room::after{
            content: '';
            z-index: -1;
            position: absolute;
            left: -30%;
            top: -100%;
            width: 700px;
            height: 800px;
            transform-origin: bottom right;
            background: linear-gradient(0deg, transparent, rgb(0, 240, 255), rgb(255, 234, 0));
            animation: animate 6s linear infinite;
        }
        #forgot-pass a:hover {
            color: rgb(43,69,180); /* 当鼠标悬停时，链接颜色变为黑色 */
        }
        .room::after{

            animation-delay: -3s;
        }
        @keyframes animate {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
        /* 弹窗（Modal）样式 */
        .modal {
            display: none; /* 默认隐藏弹窗 */
            position: fixed; /* 固定定位，覆盖整个屏幕 */
            z-index: 1000; /* 高层级，确保显示在其他内容之上 */
            left: 0;
            top: 0;
            width: 100%; /* 宽度覆盖整个视窗 */
            height: 100%; /* 高度覆盖整个视窗 */
            background-color: rgba(0,0,0,0.6); /* 半透明黑色背景 */
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
        }

        .modal-dialog {
            background: #fff;
            border-radius: 20px; /* 增加边框圆角，更接近iOS风格 */
            box-shadow: 0 4px 12px rgba(0,0,0,0.3); /* 调整阴影以获得更加柔和的效果 */
            width: 90%; /* 弹窗宽度，适度调整以适应不同屏幕 */
            max-width: 350px; /* 最大宽度限制，更符合移动设备风格 */
            animation: modalAppear 0.3s ease-out forwards; /* 定义弹窗出现的动画 */
        }

        .modal-header,
        .modal-footer {
            padding: 10px 20px;
            background: #fff; /* 页头和页脚使用纯白背景 */
            color: #333; /* 文本颜色改为深灰，增强对比 */
            border-bottom: 1px solid #eaeaea; /* 底部添加细边线，区分头部和内容区 */
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 20px 20px 0 0; /* 圆角仅在对话框顶部 */
        }

        .modal-header h2 {
            margin: 0;
            font-size: 18px; /* 调整标题字体大小 */
        }

        .modal-body {
            padding: 20px;
            line-height: 1.5; /* 行高调整 */
            color: #333; /* 正文颜色 */
            text-align: center;
        }

        .btn-close,
        #modalClose {
            background: none;
            border: none;
            color: #bbb; /* 关闭按钮颜色调整为淡灰色，减少视觉干扰 */
            font-size: 25px;
            cursor: pointer;
        }

        .btn-close:hover,
        #modalClose:hover {
            color: #666; /* 悬浮时的颜色变化，更微妙 */
        }

        .modal-footer {
            border-top: none; /* 移除页脚顶部边线 */
            border-radius: 0 0 20px 20px; /* 圆角仅在对话框底部 */
        }

        /* 弹窗出现动画效果 */
        @keyframes modalAppear {
            from {
                transform: translateY(-100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        /* 弹窗出现动画效果 */
        @keyframes modalAppear {
            from {
                transform: translateY(-100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>

<body>
<div class="room">
    <div class="shell">

        <form action="<%=request.getContextPath()%>/registerCheck" method="post">
            <div id="form-body">
                <div id="welcome-lines">
                    <div id="w-line-1">Hello,Lucy</div>
                    <div id="w-line-2">LETS GO!</div>
                </div>
                <div id="input-area">
                    <div class="f-inp">
                        <input type="text" required="required" name="account">
                        <span>Account</span>
                    </div>
                    <div class="f-inp">
                        <input type="password" required="required" name="password">
                        <span>Password</span>
                    </div>
                </div>
                <div id="submit-button-cvr">
                    <button type="submit" id="submit-button">REGISTER</button>
                </div>
                <div id="forgot-pass">
                    <a href="<%= request.getContextPath()%>/login/Login.jsp">Click to login</a>
                </div>
            </div>
        </form>
        <%--   弹窗     --%>
        <div class="modal" id="myModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-header">
                    <h2 id="modalTitle">prompt</h2>
                    <a href="#" class="btn-close" aria-hidden="true">×</a>
                </div>
                <div class="modal-body">
                    <p id="modalText"></p>
                </div>
            </div>
        </div>
        <div id="img-box">
            <img src="<%= request.getContextPath()%>/images/Register.JPG" alt="">
        </div>

    </div>
</div>
<iframe src="<%=request.getContextPath()%>/register/background.html" frameborder="0" width="100%" height="100%" style="z-index: -999; width: 100%; position: fixed;"></iframe>

</body>
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const message = "<%=request.getAttribute("Message")%>";
        const modal = document.getElementById('myModal'); // 弹窗的ID
        const modalText = document.getElementById('modalText'); // 弹窗内显示错误信息的元素的ID
        const closeButton = document.querySelector('.btn-close'); // 获取关闭按钮
        const modalTitle = document.getElementById('modalTitle');
        if (message) {
            if (message === "RegisterError") {
                modalText.textContent = 'THE REGISTER FAILS';
                modal.style.display = 'flex';
            } else if (message === "Exception") {
                modalText.textContent = 'SYSTEM EXCEPTION';
                modal.style.display = 'flex';
            } else if (message === "RegisterSuccess") {
                modalText.textContent = 'THE REGISTER SUCCEEDS';
                // modalText.textContent = '即将跳转到登录界面...';
                modal.style.display = 'flex';
                // 设置2秒后跳转
                setTimeout(function() {
                    window.location.href = "<%= request.getContextPath()%>/login/Login.jsp";
                }, 2000);
            }
        }

        // 点击关闭按钮隐藏弹窗
        closeButton.onclick = function() {
            modal.style.display = "none";
        }

        // 当用户点击弹窗之外的地方时，也关闭弹窗
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
</script>
</html>