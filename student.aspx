<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" Theme="MaterializeButton" CodeFile="student.aspx.cs" Inherits="student" %>



<asp:Content ContentPlaceHolderID="holder3" runat="server">
   

    <div class="col teal-text white">
    
          <asp:SqlDataSource runat="server" ID="dsource4"
                 ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                 SelectCommand="select * from newstudent where id=1"
                 UpdateCommand="update newstudent set email=@email, addresss=@addresss where id=1">
              <SelectParameters>
                 
              </SelectParameters>
          </asp:SqlDataSource>
          
          <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateEditButton="true" AutoGenerateRows="false" DataSourceID="dsource4">
            <Fields>
                <asp:BoundField HeaderText="Registration Number" DataField="id" ReadOnly="true"/>
                <asp:BoundField HeaderText="Name" DataField="name" ReadOnly="true"/>
                <asp:BoundField HeaderText="Department" DataField="department" ReadOnly="true"/>
                <asp:BoundField HeaderText="e-Mail" DataField="email" ReadOnly="false"/>
                <asp:BoundField HeaderText="Address" DataField="addresss" ReadOnly="false"/>
                <asp:BoundField HeaderText="AIT" DataField="ait" ReadOnly="true"/>
                <asp:BoundField HeaderText="ML" DataField="ml" ReadOnly="true"/>
                <asp:BoundField HeaderText="Attendance" DataField="attendance" ReadOnly="true"/>
            </Fields>
          </asp:DetailsView>

       </div>
  
 

      <div id='studentUpdateFormDiv' class='modal'>
         <div class="card-panel header cyan">
            <span class="black-text ">Update Details</span>
         </div>
       
            <div class="row">
               <div class="input-field col">
                  <asp:TextBox ID="name" runat="server"/>
                  <label for="name">Name</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox ID="email" runat="server"/>
                  <label for="email">e-Mail</label>
               </div>
            </div>

            <div class="row">
               <div class="input-field col">
                  <asp:TextBox ID="address" TextMode="MultiLine" runat="server"/>
                  <label for="address">Address</label>
               </div>
            </div>

            
        
         <asp:Button Text="Update Information" runat="server" />
        
         
      </div>
</asp:Content>

