<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" Theme="MaterializeButton" CodeFile="instructor.aspx.cs" Inherits="instructor" %>

 

<asp:Content runat="server" ContentPlaceHolderID="holder3">
        <div class="col cyan">
          <div class="card-panel header innerDiv white black-text" id="departmentDiv">
             <span class="black-text ">Details</span>
             <div class="card-content red-text">
             <asp:SqlDataSource runat="server" ID="SqlDataSource1"
               ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
               SelectCommand="select * from newstudent where department like (@dept)"
               UpdateCommand="update newstudent set ait=@ait, ml=@ml, attendance=@attendance where id=@id">
            <SelectParameters>
                <asp:SessionParameter Name="dept" SessionField="dept" />
            </SelectParameters>
          </asp:SqlDataSource>
         
            <asp:GridView ID="DetailsView4" DataKeyNames="id" runat="server" AutoGenerateEditButton="true" AutoGenerateColumns="false" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField HeaderText="Registration Number" DataField="id" ReadOnly="true"/>
                <asp:BoundField HeaderText="Name" DataField="name" ReadOnly="true"/>
                <asp:BoundField HeaderText="Department" DataField="department" ReadOnly="true"/>
                <asp:BoundField HeaderText="AIT" DataField="ait" ReadOnly="false"/>
                <asp:BoundField HeaderText="ML" DataField="ml" ReadOnly="false"/>
                <asp:BoundField HeaderText="Attendance" DataField="attendance" ReadOnly="false"/>
            </Columns>
          </asp:GridView>
             </div>
          </div>
       </div>
  
 

      
</asp:Content>