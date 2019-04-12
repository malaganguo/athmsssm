<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/20
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8"%>
<!--导航栏开始-->
<div class="span2">
    <div class="main-left-col">
        <h1><img src="<%=request.getContextPath()%>/assets/img/logo70-60.png" onerror="加载失败"></h1>
        <ul class="side-nav">
            <li class="active"><a href="<%=request.getContextPath()%>/toMain.action"><i class="icon-home"></i> 首页 </a></li>
            <li><a class="dropdown-toggle" data-toggle="collapse" data-target="#website-dropdown"
                   href="<%=request.getContextPath()%>/toDataQuery.action"><em class="icon-sitemap"></em> 数据查询 </a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse"
                                    data-target="#reports-dropdown" href="#"><i
                    class="icon-signal"></i> 数据分析 <b class="caret"></b></a>
                <ul id="reports-dropdown" class="collapse">
                    <%--<li><a href="<%=request.getContextPath()%>/toAnalysisSite.action">监测点分析</a></li>
                    <li><a href="<%=request.getContextPath()%>/toAnalysisDataType.action">数据类型分析</a></li>
                    <li><a href="<%=request.getContextPath()%>/toAnalysisDataTime.action">时段分析</a></li>--%>
                        <li><a href="<%=request.getContextPath()%>/toAnalysisTemp.action">温度分析</a></li>
                        <li><a href="<%=request.getContextPath()%>/toAnalysisHum.action">湿度分析</a></li>
                </ul>
            </li>
            <li><a href="<%=request.getContextPath()%>/toAuthorization.action"><i
                    class="icon-group"></i> 权限管理 <b class="caret"></b></a>
                <%--<ul id="members-dropdown" class="collapse">
                    <li><a href="<%=request.getContextPath()%>/toCreateUser.action">创建用户</a></li>
                    <li><a href="<%=request.getContextPath()%>/toVisitAuthority.action">访问权限</a></li>
                    <li><a href="<%=request.getContextPath()%>/toAdminList.action">管理员名单</a></li>
                </ul>--%>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse"
                                    data-target="#settings-dropdown" href="#"><i
                    class="icon-cogs"></i> 系统配置 <b class="caret"></b></a>
                <ul id="settings-dropdown" class="collapse">
                    <li><a href="<%=request.getContextPath()%>/toSiteManage.action">监测点管理</a></li>
                    <%--<li><a href="<%=request.getContextPath()%>/toAreaDivide.action">区域划分</a></li>--%>
                    <li><a href="<%=request.getContextPath()%>/toOperateLog.action">操作日志</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="icon-bullhorn"></i> 通知 <span class="badge badge-warning">2</span></a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse" data-target="#help-dropdown"
                                    href="#"><i
                    class="icon-info-sign"></i> 帮助 <b class="caret"></b></a>
                <ul id="help-dropdown" class="collapse">
                    <li><a href="content.html">使用手册</a></li>
                    <li class="active"><a href="content.html">技术说明</a></li>
                    <li><a href="content.html">支持</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end main-left-col -->

</div>
<!-- 导航栏结束 -->

