<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="none" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <form runat="server" class="col s30" method="GET" id="loginForm">
      <div class="row">
        <div class="input-field col">
          <asp:TextBox runat="server" id="id" ></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="id" runat="server" ErrorMessage="Enter UniqueID" />
          <label for="id">UniqueID</label>
       </div>
       </div>
        
      <div class="row">
        <div class="input-field col ">
          <asp:TextBox runat="server" id="password" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ControlToValidate="password" runat="server" ErrorMessage="Enter Password" />
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

          <asp:CustomValidator runat="server" ErrorMessage="Select One" OnServerValidate="customValidFunc"/>
      </p>

        <div class="input-field col">
          <asp:Label runat="server" id="errMsgLabel" ></asp:Label>
       </div>
      
         <asp:Button ID="Button1" runat="server" OnClick="login" cssClass="btn waves-effect waves-light" style="left:15%;"   Text="Login"/>
	 </form>

     
      
      

</div>

</body>
</html>