<%@ Page Language="C#" AutoEventWireup="true" CodeFile="instructorPage.aspx.cs" Inherits="instructorPage" %>

<!DOCTYPE html>

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
         #studTable{
            align:center;
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
          localStorage.instructorName = "Yo";
          
      </script>
      <div class="header card-panel red accent-1 ">
         <b>
            <h3>
            Welcome Yo
            <h3>
         </b>
      </div>

      <form id="Form1" runat="server">
      <div class="card-panel black header">
           
         <button class="btn waves-effect waves-light" onclick="done()" type="submit" name="action">Done
         <i class="material-icons right">send</i>
         </button>
         <button id="displayButton" class="btn waves-effect waves-light"  onclick="semesterUpdateCardCreator()" name="action">Enter Semester Details
         <i class="material-icons right">send</i>
         </button>
         
      </div>
     
       <div class="col cyan">
          <div class="card-panel header innerDiv white black-text" id="departmentDiv">
             <span class="black-text ">Details</span>
             <div class="card-content red-text">
             <table id='studTable'>
             
              
             </table>
             </div>
          </div>
       </div>
  
 

      <div id='semesterFormDiv' class='modal'>
         <div class="card-panel header cyan">
            <span class="black-text ">Update Details</span>
         </div>
        
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox ID="regnum" runat="server" />
                  <label for="regnum">Registration Number</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox ID="ait" runat="server" />
                  <label for="ait">AIT</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox ID="OOAD" runat="server" />
                  <label for="ooad">OOAD</label>
               </div>
            </div>

         <asp:Button ID="Button1" runat="server" cssClass="btn waves-effect waves-light" style="left:15%;" onClick="funcCheck"  text="Update Information"/>  
        
         
       
      </div>
          </form>
           
   </body>
</html>


