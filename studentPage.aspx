﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentPage.aspx.cs" Inherits="studentPage" %>

<html>
   <head>
      <style>
         .header{
         text-align:center;
         }
         #note_container{
         width: 50%;
         float:left;
         height:80%;
         overflow: scroll;
         }
         #reminder_container{
         width: 50%;
         float:left;
         height:80%;
         overflow: scroll;
         }
         #wrapper_1 { clear: left; float: left; position: relative; left: 43%; 
         }
         .modal{
         display: none; /* Hidden by default */
         position: fixed; /* Stay in place */
         z-index: 1; /* Sit on top */
         left: 0;
         top: 50px;
         left:100px;
         width: 50%; /* Full width */
         height: 50%; /* Full height */
         overflow: auto; /* Enable scroll if needed */
         background-color: rgb(0,0,0); /* Fallback color */
         background-color: black;
         }
         #container1{
         width:50%;
         float:left;
         height:80%;
         overflow:scroll;
         }
         #container2{
         width:50%;
         float:right;
         height:80%;
         overflow:scroll;
         }
         .innerDiv{
         width:100%;
         height:50%;
         overflow:scroll;
         }
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
      <script type="text/javascript">
         
      </script>
      <div class="header card-panel red accent-1 ">
         <b>
            <h3>
                Welcome Student
            <h3>
         </b>
      </div>
      <div class="card-panel black header">
         <button class="btn waves-effect waves-light" onclick="done()" type="submit" name="action">Done
         <i class="material-icons right">send</i>
         </button>
         <button id="displayButton" class="btn waves-effect waves-light"  onclick="studentUpdateCardCreator()" name="action">Add Student
         <i class="material-icons right">send</i>
         </button>
        
      </div>
     <form runat="server">
       <div class="col teal-text white">
        
                
                 
                    <asp:SqlDataSource runat="server" ID="dsource4"
                         ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                         SelectCommand="select * from student where rollno=1" />
                    <asp:DetailsView ID="DetailsView4" runat="server" DataSourceID="dsource4" AutoGenerateEditButton="true" />
                     
                
            
       </div>
  
 

      <div id='studentUpdateFormDiv' class='modal'>
         <div class="card-panel header cyan">
            <span class="black-text ">Update Details</span>
         </div>
       
            <div class="row">
               <div class="input-field col">
                  <input id="fatherName" type="text" class="validate">
                  <label for="fatherName">Father's Name</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <input id="motherName" type="text" class="validate">
                  <label for="motehrName">Mother's Name</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <input id="city" type="text" class="validate">
                  <label for="city">Father's Phone</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <input id="state" type="text" class="validate">
                  <label for="state">Mother's Phone</label>
               </div>
            </div> 
        
         <button class="btn waves-effect waves-light" style="left:15%;"  onclick="updateStudent()" name="action">Update Information
         <i class="material-icons right">send</i>
         </button>
         
      </div>
         </form>   
   </body>
</html>

