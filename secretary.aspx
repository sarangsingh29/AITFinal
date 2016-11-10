<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MasterPage.master" Theme="MaterializeButton" CodeFile="secretary.aspx.cs" Inherits="secretary" %>



<asp:Content ContentPlaceHolderID="holder3" runat="server">
     <div class="row purple">
          

            <asp:MultiView ID="MultiView1"  runat="server" ActiveViewIndex="0">
                <asp:View runat="server" id="deptView">
                   <div class="card-panel header innerDiv white black-text"  id="departmentDiv">
                 <span class="black-text ">Department Details</span>
                       <asp:Button ID="Button5" runat="Server" Text="Inventory" CommandName="SwitchViewByID" CommandArgument="addOrderView"/>
                       <asp:Button ID="Button9" runat="Server" Text="Finance" CommandName="SwitchViewByID" CommandArgument="addFinanceView"/>
                       <asp:Button ID="Button16" runat="Server" Text="Academic" CommandName="SwitchViewByID" CommandArgument="addAcadView"/>
                       <asp:Button ID="Button20" runat="Server" Text="Student" CommandName="SwitchViewByID" CommandArgument="addStudentView"/>
                       <asp:Button ID="Button21" runat="Server" Text="Next" CommandName="NextView"/>
                       <asp:Button ID="Button31" runat="Server" Text="Previous" CommandName="PrevView"/> 
                 <div class="card-content teal-text">
                    
                      <asp:SqlDataSource  ID="deptDetSource" runat="server" 
                                    ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                                    SelectCommand="select * from department">

                    </asp:SqlDataSource>
                    <asp:DetailsView ID="DetailView3" runat="server" DataSourceID="deptDetSource" />  
                 </div>
               </div>
                </asp:View>

               <asp:View runat="server" id="acadView">
                   <div class="card-panel header innerDiv white black-text">
                 <span class="black-text ">Academic Details</span>
                       <asp:Button ID="Button1" runat="Server" Text="Inventory" CommandName="SwitchViewByID" CommandArgument="addOrderView"/>
                       <asp:Button ID="Button2" runat="Server" Text="Finance" CommandName="SwitchViewByID" CommandArgument="addFinanceView"/>
                       <asp:Button ID="Button3" runat="Server" Text="Academic" CommandName="SwitchViewByID" CommandArgument="addAcadView"/>
                       <asp:Button ID="Button4" runat="Server" Text="Student" CommandName="SwitchViewByID" CommandArgument="addStudentView"/>
                       <asp:Button ID="Button22" runat="Server" Text="Next" CommandName="NextView"/>
                       <asp:Button ID="Button23" runat="Server" Text="Previous" CommandName="PrevView"/> 
                    
                           <asp:SqlDataSource  ID="acadDetSource" runat="server" 
                                    ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                                    SelectCommand="select * from academic">

                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" DataSourceID="acadDetSource" />  
                     
                 </div>
               </div>
                   <asp:Wizard runat="server"></asp:Wizard>
                </asp:View>

                <asp:View runat="server" id="financeView">
                   <div class="card-panel header innerDiv white black-text" id="Div2">
                 <span class="black-text ">Financial Details</span>
                       <asp:Button ID="Button10" runat="Server" Text="Inventory" CommandName="SwitchViewByID" CommandArgument="addOrderView"/>
                       <asp:Button ID="Button11" runat="Server" Text="Finance" CommandName="SwitchViewByID" CommandArgument="addFinanceView"/>
                       <asp:Button ID="Button12" runat="Server" Text="Academic" CommandName="SwitchViewByID" CommandArgument="addAcadView"/>
                       <asp:Button ID="Button17" runat="Server" Text="Student" CommandName="SwitchViewByID" CommandArgument="addStudentView"/>
                       <asp:Button ID="Button24" runat="Server" Text="Next" CommandName="NextView"/>
                       <asp:Button ID="Button25" runat="Server" Text="Previous" CommandName="PrevView"/> 
                 <div class="card-content teal-text">
                    <asp:SqlDataSource  ID="finDetSource" runat="server" 
                                    ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                                    SelectCommand="select * from finance">

                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="finDetSource" />   
                 </div>
               </div>
                </asp:View>

                <asp:View runat="server" id="inventoryView">
                   <div class="card-panel header innerDiv white black-text" id="Div3">
                 <span class="black-text ">Inventory Details</span>
                       <asp:Button ID="Button13" runat="Server" Text="Inventory" CommandName="SwitchViewByID" CommandArgument="addOrderView"/>
                       <asp:Button ID="Button14" runat="Server" Text="Finance" CommandName="SwitchViewByID" CommandArgument="addFinanceView"/>
                       <asp:Button ID="Button18" runat="Server" Text="Academic" CommandName="SwitchViewByID" CommandArgument="addAcadView"/>
                       <asp:Button ID="Button19" runat="Server" Text="Student" CommandName="SwitchViewByID" CommandArgument="addStudentView"/>
                       <asp:Button ID="Button34" runat="Server" Text="Previous" CommandName="PrevView"/> 
                       
               <div class="card-content teal-text">
                    <asp:SqlDataSource  ID="invDetSource" runat="server" 
                                    ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                                    SelectCommand="select item,quantity from inventory">

                    </asp:SqlDataSource>
                    <asp:GridView runat="server" DataSourceID="invDetSource" />
                 </div>
               </div>
                </asp:View>

                <asp:View runat="server" ID="addFinanceView">
                    <div class="card-panel header innerDiv white black-text" id="Div1">
                        <asp:Button ID="Button28" runat="Server" Text="Home" CommandName="SwitchViewByID" CommandArgument="deptView"/>
                      <asp:Wizard runat="server" ID="addFinanceWizard" OnNextButtonClick="finNextBut" OnFinishButtonClick="wizardFinish">
                        <WizardSteps>
                            <asp:WizardStep runat="server" Title="Enter Details">
                                Donor Name: <asp:TextBox runat="server" ID="donorBox" />
                                Amount: <asp:TextBox runat="server" ID="amountBox" />
                                <asp:Calendar runat="server" ID="finCal" />
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep1" runat="server" Title="Confirm Details">
                                <div class="input-field col">
                                <asp:TextBox runat="server" Enabled="false" ID="confirmBox" TextMode="MultiLine" />
                                </div>
                                <div class="input-field col">
                                    <asp:Label runat="server" ID="finMsgLabel" />
                                </div>
                                <asp:Button ID="Button33" runat="server" OnClick="finSave" Text="Add To Table" />
                                <asp:Button runat="server" onclick="finFileSave" Text="Save To File" />
                                 
                                
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                   </div>
                </asp:View>

                <asp:View runat="server" ID="addOrderView">
                    <div class="card-panel header innerDiv white black-text" id="Div4">
                      <asp:Button ID="Button29" runat="Server" Text="Home" CommandName="SwitchViewByID" CommandArgument="deptView"/>
                      <asp:Wizard runat="server" ID="orderWizard" OnNextButtonClick="ordNextBut" OnFinishButtonClick="wizardFinish">
                        <WizardSteps>
                            <asp:WizardStep runat="server" Title="Enter Details">
                                <asp:DropDownList ID="ordList" runat="server">
                                    <asp:ListItem Value="150">Chair</asp:ListItem>
                                    <asp:ListItem Value="2000">Computer</asp:ListItem>
                                </asp:DropDownList>
                                Quantity: <asp:TextBox runat="server" ID="ordQty" />
                                
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep3" runat="server" Title="Confirm Details">
                                <asp:TextBox runat="server" Enabled="false" ID="ordConfirmBox" TextMode="MultiLine" />
                                <asp:Label runat="server" ID="ordMsgLabel" />
                                <asp:Button ID="Button32" runat="server" OnClick="orderSave" Text="Add" />
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                     
                   </div>
                   
                </asp:View>


                <asp:View runat="server" ID="addAcadView">
                    <asp:Button ID="Button30" runat="Server" Text="Home" CommandName="SwitchViewByID" CommandArgument="deptView"/>
                    <div class="card-panel header innerDiv white black-text" id="Div5">
                       <div class="input-field col">
                        <asp:TextBox runat="server" ID="acadTitle" />
                        <label for="acadTitle">Title</label>
                    </div>
                        <div class="input-field col">
                       <asp:TextBox runat="server" ID="acadAuthor" />
                        <label for="acadAuthor">Author</label>
                            </div>
                        <div class="input-field col">
                       <asp:TextBox runat="server" ID="acadDesc" />
                        <label for="acadDesc">Description</label>
                        </div>
                         <div class="input-field col">
                            <asp:Label runat="server" ID="acadMsgLabel" />
                        </div>
                        <asp:Button runat="server" OnClick="acadSave" Text="Save" />
                        
                   </div>
                </asp:View>


                <asp:View runat="server" ID="addStudentView">
                     <div class="card-panel header innerDiv white black-text" id="Div6">
                      <asp:Button ID="Button26" runat="Server" Text="Home" CommandName="SwitchViewByID" CommandArgument="deptView"/>
                      <asp:Wizard runat="server" ID="studWizard" OnFinishButtonClick="wizardFinish">
                        <WizardSteps>
                            <asp:WizardStep ID="WizardStep2" runat="server" Title="Enter Registraion Number">
                                
                                RegNo: <asp:TextBox runat="server" ID="regnoBox" />
                                
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep4" runat="server" Title="Confirm Details">
                                <asp:SqlDataSource  ID="addStudDataSource" runat="server" 
                                    ConnectionString="Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False"
                                    SelectCommand="select * from newstudent where id=@regno"
                                    UpdateCommand="update newstudent set name=@name, department=@department, email=@email, addresss=@addresss, ait=@ait, ml=@ml, attendance=@attendance where id=@regno">
                                    
                                    <SelectParameters>
                                        <asp:ControlParameter Name="regno" ControlID="regnoBox" PropertyName="Text" />
                                    </SelectParameters>

                                    <UpdateParameters>
                                        <asp:ControlParameter Name="regno" ControlID="regnoBox" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:DetailsView runat="server" AutoGenerateEditButton="true" DataSourceID="addStudDataSource" />
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
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
             <asp:Button ID="Button6" runat="server" Text="Save Academics" />
         
         
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

              <asp:Button ID="Button7" runat="server" Text="Save Finance" />
        
           
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
             <asp:Button ID="Button15" runat="server" Text="Save Student" />
        
         
         
      </div>
</asp:Content>