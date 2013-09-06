<%-- 
    Document   : updateview
    Created on : Sep 3, 2013, 4:33:02 AM
    Author     : dkrebodesign.com
--%>

<%@page import="com.portofolio.konektor.KoneksiDatabase"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Negara</title>
    </head>
    <body>
        
        <h1>Update Negara</h1>
        <div style="width: 400px; height: 400px;">
        <p>Edit Data </p>
        
        
          <%
        //initializasion parameter
    String id= request.getParameter("id");
    Connection con = null;
    Statement stm = null;
    ResultSet rs = null;
    String sqlViewDetail="select * from countries where ctr_id='"+id+"' ";
    
    try{
    con =KoneksiDatabase.getKoneksi();
    if(con != null){
    stm = con.createStatement();
    rs  = stm.executeQuery(sqlViewDetail);
    
    while(rs.next()){
    
    int    idNegara= rs.getInt("ctr_id");
    String code_negara =rs.getString("ctr_code");
    String nama_negara= rs.getString("ctr_name");
    %>
    <a href="index.jsp">HOME</a><br />
    <form action="./update.jsp" method="post">
        <input type="hidden" value="<% out.println(idNegara);%>" name="id_data" /><br />
            Kode Negara<input name ="code_negara" type="text" value="<% out.println(code_negara); %>" /><br /><br />
            Nama Negara<input name="nama_negara"  type="text" value="<% out.println(nama_negara);%>" /><br /><br /><br />
            <input type="submit" value="Update">
        </form>
        
    
    
    <%
       }
    }else{out.println("gagal konek database");}
    }catch(SQLException e){
    out.println(e);
    }finally{
    
    rs.close();
    stm.close();
    
    }
    
    
    %>
        
            </div>
        </body>
</html>
