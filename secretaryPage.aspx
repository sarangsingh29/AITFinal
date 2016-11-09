<%@ Page Language="C#" AutoEventWireup="true" CodeFile="secretaryPage.aspx.cs" Theme="MaterializeButton" Inherits="secretaryPage" %>

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
         height: 100%; /* Full height */
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
         color:black;
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
      <script type="text/javascript">sendAjax("SecretaryServlet?type=first", true)</script>
      <div class="header card-panel white accent-1 ">
         <b>
            <h3>
                Welcome Secretary
            <h3>
         </b>
      </div>
      <div class="card-panel black header">
         <button class="btn waves-effect waves-light" onclick="done()" type="submit" name="action">Done
         <i class="material-icons right">send</i>
         </button>
         <button id="displayButton" class="btn waves-effect waves-light"  onclick="orderCardCreator()" name="action">Order
         <i class="material-icons right">send</i>
         </button>
         <button id="Button1" class="btn waves-effect waves-light"  onclick="academicCardCreator()" name="action">Add Academics
         <i class="material-icons right">send</i>
         </button>
         <button id="Button2" class="btn waves-effect waves-light"  onclick="financeCardCreator()" name="action">Add Finance
         <i class="material-icons right">send</i>
         </button>
         <button id="Button3" class="btn waves-effect waves-light"  onclick="studentCardCreator()" name="action">Add Student
         <i class="material-icons right">send</i>
         </button>
        
      </div>




       <form id="Form1" runat="server">

      <div class="row purple">
          

            <asp:MultiView runat="server" ActiveViewIndex="0">
                <asp:View runat="server" id="deptView">
                   <div class="card-panel header innerDiv white black-text" id="departmentDiv">
                 <span class="black-text ">Department Details</span>
                        <asp:Button ID="Button9" runat="server" onclick="func" Text="Go" />
                         <asp:Button ID="Button5" runat="server" CommandName="NextView" Text="Next View" />
                 <div class="card-content teal-text">
                    <asp:SqlDataSource runat="server" ID="dsource"
                         ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                         SelectCommand="select * from student" />
                    <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="dsource" />
                     
                 </div>
               </div>
                </asp:View>

               <asp:View runat="server" id="View1">
                   <div class="card-panel header innerDiv white black-text" id="Div1">
                 <span class="black-text ">Academic Details</span>
                        <asp:Button ID="Button4" runat="server" onclick="func" Text="Go" />
                         <asp:Button ID="Button10" runat="server" CommandName="NextView" Text="Next View" />
                 <div class="card-content teal-text">
                    <asp:SqlDataSource runat="server" ID="dsource2"
                         ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                         SelectCommand="select * from student" />
                    <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="dsource2" />
                     
                 </div>
               </div>
                </asp:View>

                <asp:View runat="server" id="View2">
                   <div class="card-panel header innerDiv white black-text" id="Div2">
                 <span class="black-text ">Financial Details</span>
                        <asp:Button ID="Button11" runat="server" onclick="func" Text="Go" />
                         <asp:Button ID="Button12" runat="server" CommandName="NextView" Text="Next View" />
                 <div class="card-content teal-text">
                    <asp:SqlDataSource runat="server" ID="dsource3"
                         ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                         SelectCommand="select * from student" />
                    <asp:DetailsView ID="DetailsView3" runat="server" DataSourceID="dsource3" />
                     
                 </div>
               </div>
                </asp:View>

                <asp:View runat="server" id="View3">
                   <div class="card-panel header innerDiv white black-text" id="Div3">
                 <span class="black-text "Inventory Details</span>
                        <asp:Button ID="Button13" runat="server" onclick="func" Text="Go" />
                         <asp:Button ID="Button14" runat="server" CommandName="NextView" Text="Next View" />
                 <div class="card-content teal-text">
                    <asp:SqlDataSource runat="server" ID="dsource4"
                         ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                         SelectCommand="select * from student" />
                    <asp:DetailsView ID="DetailsView4" runat="server" DataSourceID="dsource4" />
                     
                 </div>
               </div>
                </asp:View>
            </asp:MultiView>      
         
      </div>
 
      <div id='orderFormDiv' class='modal'>
         <div class="card-panel header cyan">
            <span class="black-text ">Place Order</span>
         </div>
        
            <div class="row">
               <div class="input-field col ">
                  <select id='inventorySelect'>
                    <option value="" disabled selected>Choose Inventory</option>
                    <option value="150">Chair</option>
                    <option value="230">Computer</option>
                  </select>
                  <label>Inventory</label>
               </div>
            </div>
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="qty"/>
                  <label for="qty">Quantity</label>
               </div>
            </div>
            
            <asp:Button ID="Button8" runat="server" Text="Save Order" />
        
         
      </div>

      <div id='academicFormDiv' class='modal'>
         <div class="card-panel header cyan">
            <span class="black-text ">New Academic Activity</span>
         </div>
         
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="title"/>
                  <label for="title">Title</label>
               </div>
            </div>
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="author"/>
                  <label for="author">Author</label>
               </div>
            </div>
             <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="description"/>
                  <label for="description">Description</label>
               </div>
            </div>
             <asp:Button runat="server" Text="Save Academics" />
         
         
      </div>

      <div id='financeFormDiv' class='modal'>
         <div class="card-panel header cyan">
            <span class="black-text ">New Financial Activity</span>
         </div>
        
            <div class="row">
               <div class="input-field col">
                 <asp:TextBox runat="server" id="donor"/>
                  <label for="donor">Donor</label>
               </div>
            </div>
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="amount"/>
                  <label for="amount">Amount</label>
               </div>
            </div>

             <div class="row">
               <div class="input-field col">
                  <asp:Calendar runat="server" ID="finCalendar"  />
                  <label>Amount</label>
               </div>
            </div>

              <asp:Button ID="Button6" runat="server" Text="Save Finance" />
        
           
      </div>

      <div id='studentFormDiv' class='modal' runat="server">
         <div class="card-panel header cyan">
            <span class="black-text ">Add Student</span>
         </div>
         
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="name"/>
                  <label for="name">Name</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="appNum"/>
                  <label for="appNum">Application Number</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="email"/>
                  <label for="email">e-Mail</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox runat="server" id="emergency"/>
                  <label for="emergency">Emergency</label>
               </div>
            </div>
             <asp:Button ID="Button7" runat="server" Text="Save Student" />
        
         
         
      </div>
     </form>
   </body>
</html>

