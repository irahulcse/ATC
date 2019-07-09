<html>
<head>
<link rel='stylesheet' href='../bootstrap.min.css'/>
</head>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<body>
<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
if(session.getAttribute("libusername")==null)
{
	response.sendRedirect("../index.jsp");
}
%>


<jsp:include page="navheader.jsp" />
<form method="post" action="BookUpdate.jsp" name="form">
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from books where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<br>
<br>
<br>
<br>
 <div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1" text-align:center;>BOOK ID</label>
    <input type="text" class="form-control" name="bookno" value="<%=rs.getString(2)%>" readonly/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">BOOK NAME</label>
    <input type="text" class="form-control" name="bookname" value="<%=rs.getString(3)%>"; required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">AUTHOR</label>
    <input type="text" class="form-control" name="author" value="<%=rs.getString(4)%>"; required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">PUBLISHER</label>
    <input type="text" class="form-control" name="publisher" value="<%=rs.getString(5)%>"; required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">PUBLICATION_YEAR</label>
    <input type="text" class="form-control" name="publication_year" value="<%=rs.getString(6)%>"; pattern="[1-3]{1}[0-9]{3}" 
       title="Publication Year's  First Digit should be 1-3 and Last Three should be from 1-9" required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">LANGUAGE</label>
    <input type="text" class="form-control" name="language" value="<%=rs.getString(7)%>"; readonly/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">GENRE OF BOOK</label>
    <input type="text" class="form-control" name="genre" value="<%=rs.getString(8)%>"; readonly/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">QOH</label>
    <input type="number" class="form-control" name="qoh" value="<%=rs.getString(10)%>" min="1"/>
</div>
<br>
<br>

<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <input type="hidden" class="form-control" name="id" value="<%=rs.getString(1)%>" />
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
<input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</div>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</form>
</html>