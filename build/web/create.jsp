<%-- 
    Document   : viewall
    Created on : Aug 30, 2013, 2:11:56 PM
    Author     : dkrebodesign.com
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.portofolio.konektor.KoneksiDatabase" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <center><h1>Tambah Negara</h1></center><br />
       <center> 
            <a href="index.jsp">HOME</a><br />&nbsp;
          <div  style="background-color:darkgray; width: 400px; ">
              <form action="create.jsp" name="create_negara" method="post">

               Masukkan Kode Negara Baru <input type="text" name="kode_negara" /><br /><br />
                Masukkan Nama Negara Baru <input type="text" name="nama_negara" /><br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="simpan">

            </form>
            </div>
       </center>
        <%     
            
        String kodeNegara = request.getParameter("kode_negara");
        String namaNegara= request.getParameter("nama_negara");
        
        String sqlInsert="insert into countries (ctr_code,ctr_name) values (?,?)";
        Connection koneksi = KoneksiDatabase.getKoneksi();
        //koneksi.setAutoCommit(false);
        if(kodeNegara==null && namaNegara==null){
        
        out.println("<center><div><font size=\'1\'; color=\'red\'>*Kode negara tidak boleh kosong</font><br />");
        out.println("<font size=\'1\'; color=\'red\'>*Nama negara tidak boleh kosong</font><br /></div></center>");
        }else
        
        try{
                
                PreparedStatement pr = koneksi.prepareStatement(sqlInsert);
                pr.setString(1, kodeNegara);
                pr.setString(2, namaNegara);
                //koneksi.commit();
                //koneksi.close(); 
                //response.sendRedirect("./viewall.jsp");
                pr.executeUpdate();
	        out.println("<a href=\'./viewall.jsp\'>View all</a>");
               // response.sendRedirect("./viewall.jsp");
                
                
                
                //out.print("<h1>Berhasil di rubah</h1><br />");
                //out.println("<a href=\'viewall.jsp\'>Tampilkan Semua data</a>");
        }catch(SQLException ex){
              out.println(ex);
              //koneksi.rollback();
              koneksi.close();
        
        }
        
        
        
        
        %>
        
        
    </body>
</html>
