<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>

<head>

<style>
 .header{
 	text-align:center;
 	
 }
 #wrapper_1 { clear: left; float: left; position: relative; left: 43%; }
 body{
 	color:teal;
 }
 </style>

 <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

 <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>

</head>
<body class="black">
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="js/materialize.js"></script>
  <script type="text/javascript" src="js/noteUtils.js"></script>
  <script type="text/javascript" src="js/mailUtils.js"></script>
  <script type="text/javascript" src="js/utils.js"></script>

<div class="header card-panel white lighten-2 ">
	<b><h3>Department Information System<h3></b>
</div>

<div class=" " id="wrapper_1">
    <form runat="server" class="col s30" method="GET" id="loginForm" action="LoginServlet">
      <div class="row">
        <div class="input-field col">
          <asp:TextBox runat="server" id="username" ></asp:TextBox>
          <label for="username">Username</label>
       </div>
       </div>
        
      <div class="row">
        <div class="input-field col ">
          <asp:TextBox runat="server" id="password" TextMode="Password"></asp:TextBox>
          <label for="password">Password</label>
        </div>
      </div>

      <p>
          <asp:RadioButton runat="server" id="test1" GroupName="type" />
          <label for="test1">Student</label>
      
          <asp:RadioButton runat="server" id="test2" GroupName="type" />
          <label for="test2">Secretary</label>

          <asp:RadioButton runat="server" id="test3" GroupName="type" />
          <label for="test3">Instructor</label>      
      </p>
      
         <asp:Button ID="Button1" runat="server" cssClass="btn waves-effect waves-light" style="left:15%;"   Text="Login"/>
	 </form>

     
      
      

</div>

</body>
</html>