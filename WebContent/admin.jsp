<!DOCTYPE html>
<html>

<%@ page import ="java.sql.*" %>
<% 

	//ALL QUERYING
	
	String bestcustomer = "NONE";
	double fare = 0;
	double bestfare = 0;
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ec2-18-216-224-152.us-east-2.compute.amazonaws.com:3306/Database","admin", "database");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("SELECT passenger, sum(fare) FROM Reservation GROUP BY passenger ORDER BY fare");	    
			    while(rs.next()){
			    	//out.println("PASS : " + rs.getString("Passenger") + "| AMT : " + rs.getDouble(2));
			    	fare = rs.getDouble(2);
							if(bestfare < fare){
								bestfare = fare;
								bestcustomer = rs.getString("Passenger");
							}	
			    }//While   
			    
    String mostactive1 = "";
    String mostactive2 = "";
    String mostactive3 = "";
    String mostactive4 = "";
    String mostactive5 = "";
    	rs = st.executeQuery("SELECT TransitLineName, count(ReservationNumber) AS rescount FROM Planned GROUP BY TransitLineName ORDER BY rescount DESC LIMIT 5;");	
	    	rs.next();
	    	mostactive1 = rs.getString("TransitLineName");		rs.next();
	    	mostactive2 = rs.getString("TransitLineName");		rs.next();
	    	mostactive3 = rs.getString("TransitLineName");		rs.next();
	    	mostactive4 = rs.getString("TransitLineName");		rs.next();
	    	mostactive5 = rs.getString("TransitLineName");		
		   
%>

<head>
  <title>Admin Panel</title>
  <link rel="stylesheet" type="text/css" href="css/admincss.css">
  <link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="Images/Tab-Picture.jpg">
</head>

<body>

<ul>
    <li style = "float:right"><a href="logout.jsp">Logout</a></li>
</ul>
	
	
	
	
	
		<div class="addrep">
    		<p><div class = "toptext"><h1><b>ADD Customer-Rep</b></h1><br/></div></p>
        		<div class = "blankboxes">
        			<form action="admin_utilities/add.jsp" method="POST">
			        		<b>Username : </b><input type="text" id="addusername" name="addusername"/> <br/>
			        	    <b>Password : </b><input type="text" id="addpassword" name="addpassword"/> <br/>
				        	<b>SSN : </b><input type="text" id="addssn" name="addssn"/> <br/>
				        	<b>First Name : </b><input type="text" id="addfirstname" name="addfirstname"/> <br/>
				        	<b>Last Name : </b><input type="text" id="addlastname" name="addlastname"/> <br/>
				        	<button href="#" class="button1">ADD</button>
	     			 </form>
        		</div>
        	
        </div>
        
        
        
        
        
        <div class="updaterep">
    		<p><div class = "toptext"><h1><b>UPDATE Customer-Rep</b></h1><br/></div></p>
        		<div class = "blankboxes2">
        			<form action="admin_utilities/update.jsp" method="POST">
        					<b>OLD Username : </b><input type="text" id="updateusernamechanging" name="updateusernamechanging"/> <br/>
			        		<b><br/>NEW Username : </b><input type="text" id="updateusername" name="updateusername"/> <br/>
			        	    <b>Password : </b><input type="text" id="updatepassword" name="updatepassword"/> <br/>
				        	<b>SSN : </b><input type="text" id="updatessn" name="updatessn"/> <br/>
				        	<b>First Name : </b><input type="text" id="updatefirstname" name="updatefirstname"/> <br/>
				        	<b>Last Name : </b><input type="text" id="updatelastname" name="updatelastname"/> <br/>
				        	<button href="#" class="button2">UPDATE</button>
	     			 </form>
        		</div>
        </div>
        
        
        
        
        
        <div class="deleterep">
    		<p><div class = "toptext"><h1><b>DELETE Customer-Rep</b></h1><br/></div></p>
        		<div class = "blankboxes">
        			<form action="admin_utilities/delete.jsp" method="POST">	
			        		<b>Username : </b><input type="text" id="deleteusername" name="deleteusername"/> <br/>
			        		<button href="#" class="button3">DELETE</button>
	     			 </form>
        		</div>
        </div>
	
	
	
	
	
		<div class="best-box">
			<p><div class = "toptext"><h1><b>Best Customer</b></h1><br/></div></p>
					<div class = "best-customer">
							<%
								out.println("<p>" + bestcustomer + "</p>");
							%>
					</div>
					
			<div class = "middletext"><h1><b>Most Active<br/>Transit Lines</b></h1><br/></div>
					<div class = "most-active">
							<% 
							out.println("<p><b>" + mostactive1 + "</br>" + mostactive2 + "</br>" + mostactive3  + "</br>" + mostactive4  + "</br>" + mostactive5 +"</b></p>");
							%>
					</div>
			

		</div>
		
		
		
		
		
		
		
		
		
		<div class="bottomhalf">
				
					<div class="salereports">
			    		<p><div class = "toptext"><h1><b>Sale Reports</b></h1><br/></div></p>
			    		<div class="formboxes">
			    		
				    		<form action="admin_utilities/showreports.jsp" method="POST" id="saleform">
									
									<button href="#" class="greybutton">Generate Sale Reports</button>

									<br><br><select name="month" id="month" form="saleform">
										<option value="January">January</option>
										<option value="February">February</option>
										<option value="March">March</option>
										<option value="April">April</option>
										<option value="May">May</option>
										<option value="June">June</option>
										<option value="July">July</option>
										<option value="August">August</option>
										<option value="September">September</option>
										<option value="October">October</option>
										<option value="November">November</option>
										<option value="December">December</option>
									</select>

							</form> 
			        	 </div>
			        </div>
			        
			        
			        
			        
			        
			        <div class="revenue">
			    		<p><div class = "toptext"><h1><b>Revenues</b></h1><br/></div></p>
			    		 	<div class="formboxes">
									<form action="admin_utilities/showrevenue.jsp" method="POST">
											<div>
														<button type="submit" href="#" class="greybutton">Generate Revenue Chart</button>
			
														<br><br/><input type="radio" id="sortTL" name="sort1" value="sortTL" checked>
														<label for="sortTL"><b>Sort By Transit Line</b></label>
														
														<br/><input type="radio" id="sortCN" name="sort1" value="sortCN">
														<label for="sortCN"><b>Sort By Customer Name</b></label>
											</div>
									</form> 
			    			  </div>
			        </div>
			        		        
			        
			        
			        
			        
			        <div class="reservations">
			    		<p><div class = "toptext"><h1><b>Reservations</b></h1><br/></div></p>
			    			<div class="formboxes">
									<form action="admin_utilities/showreservations.jsp" method="POST">
											<button href="#" class="greybutton">Search Reservations</button>	
											
											<br><br><input type="radio" id="searchTL" name="sort2" value="searchTL" checked>
											<label for="sortTL"><b>Search By Transit Line</b></label>
											
											<br/><input type="radio" id="searchCN" name="sort2" value="searchCN">
											<label for="sortCN"><b>Search By Customer Name</b></label>
									</form> 
			    			  </div>
			        </div>
				
				
				
				
				
					<div class="lastextrabox">
						<p><div class = "toptext"><h1><b>Currently Logged In :</b></h1><br/></div></p>
						<div class = "best-customer">
								<%out.println((String)request.getSession().getAttribute("user"));%>
						</div>
			
					</div>
			
		</div>
		
</body>
</html>
 