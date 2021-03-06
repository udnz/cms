﻿<%@ Page Language="C#" Inherits="SiteServer.BackgroundPages.Cms.PageConfigurationUploadFile" %>
  <%@ Register TagPrefix="ctrl" Namespace="SiteServer.BackgroundPages.Controls" Assembly="SiteServer.BackgroundPages" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <!--#include file="../inc/head.html"-->
    </head>

    <body>
      <form class="m-l-15 m-r-15" runat="server">

        <div class="card-box">
          <ul class="nav nav-pills">
            <li class="nav-item">
              <a class="nav-link" href="pageConfigurationUploadImage.aspx?publishmentSystemId=<%=PublishmentSystemId%>">图片上传设置</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pageConfigurationUploadVideo.aspx?publishmentSystemId=<%=PublishmentSystemId%>">视频上传设置</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="javascript:;">附件上传设置</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pageConfigurationWatermark.aspx?publishmentSystemId=<%=PublishmentSystemId%>">图片水印设置</a>
            </li>
          </ul>
        </div>

        <ctrl:alerts runat="server" />

        <div class="card-box">
          <div class="form-group">
            <label class="col-form-label">附件上传文件夹
              <asp:RequiredFieldValidator ControlToValidate="TbFileUploadDirectoryName" errorMessage=" *" foreColor="red" display="Dynamic"
                runat="server" />
              <asp:RegularExpressionValidator runat="server" ControlToValidate="TbFileUploadDirectoryName" ValidationExpression="[^']+"
                errorMessage=" *" foreColor="red" display="Dynamic" />
            </label>
            <asp:TextBox class="form-control" MaxLength="50" id="TbFileUploadDirectoryName" runat="server" />
          </div>

          <div class="form-group">
            <label class="col-form-label">附件上传保存方式</label>
            <asp:DropDownList ID="DdlFileUploadDateFormatString" class="form-control" runat="server"></asp:DropDownList>
            <small class="form-text text-muted">
              本设置只影响新上传的附件, 设置更改之前的附件仍存放在原来位置
            </small>
          </div>

          <div class="form-group">
            <label class="col-form-label">是否按时间重命名上传的附件</label>
            <asp:DropDownList ID="DdlIsFileUploadChangeFileName" class="form-control" runat="server"></asp:DropDownList>
            <small class="form-text text-muted">
              本设置只影响新上传的附件, 设置更改之前的附件名仍保持不变
            </small>
          </div>

          <div class="form-group">
            <label class="col-form-label">允许上传的文件类型
              <asp:RegularExpressionValidator runat="server" ControlToValidate="TbFileUploadTypeCollection" ValidationExpression="[^']+"
                errorMessage=" *" foreColor="red" display="Dynamic" />
            </label>
            <asp:TextBox class="form-control" TextMode="MultiLine" Height="100" id="TbFileUploadTypeCollection" runat="server" />
            <small class="form-text text-muted">
              类型之间用“,”分割
            </small>
          </div>

          <div class="form-group">
            <label class="col-form-label">上传附件最大大小
              <asp:RequiredFieldValidator ControlToValidate="TbFileUploadTypeMaxSize" errorMessage=" *" foreColor="red" display="Dynamic"
                runat="server" />
              <asp:RegularExpressionValidator ControlToValidate="TbFileUploadTypeMaxSize" ValidationExpression="\d+" Display="Dynamic"
                ErrorMessage="上传附件最大大小必须为整数" foreColor="red" runat="server" />
            </label>
            <div class="row">
              <div class="col">
                <asp:TextBox class="form-control" Columns="10" MaxLength="50" id="TbFileUploadTypeMaxSize" runat="server" />
              </div>
              <div class="col">
                <asp:DropDownList id="DdlFileUploadTypeUnit" class="form-control" runat="server">
                  <asp:ListItem Value="KB" Text="KB" Selected="true"></asp:ListItem>
                  <asp:ListItem Value="MB" Text="MB"></asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
          </div>

          <hr />

          <asp:Button class="btn btn-primary" id="Submit" text="确 定" onclick="Submit_OnClick" runat="server" />

        </div>

      </form>
    </body>

    </html>
    <!--#include file="../inc/foot.html"-->