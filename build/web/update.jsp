<%-- 
    Document   : viewall
    Created on : Aug 30, 2013, 2:11:56 PM
    Author     : dkrebodesign.com
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.portofolio.konektor.KoneksiDatabase"%>
<%@page import="java.sql.Connection"%>

<%
Connection koneksi=null;
PreparedStatement ps= null;

String id_data = request.getParameter("id_data").trim();
String code_negara=request.getParameter("code_negara");
String nama_negara=request.getParameter("nama_negara");

int idData= Integer.parseInt(id_data);
String sqlQueryUpdate="update countries set ctr_code=?,ctr_name=? where ctr_id=?";


//koneksi = KoneksiDatabase.getKoneksi();

//st = koneksi.prepareStatement("");

try{
koneksi =KoneksiDatabase.getKoneksi();
ps = koneksi.prepareStatement(sqlQueryUpdate);
ps.setString(1, code_negara);
ps.setString(2, nama_negara);
ps.setInt(3, idData);

ps.executeUpdate();

out.println("Record is updated<br />");
out.println("<a href=\'./viewall.jsp\'>Tampilkan Data seluruhnya</a>");

}catch(SQLException ex){
out.println(ex);

}finally{

    if(ps != null){
    ps.close();
    }
    if(koneksi != null){
    
    koneksi.close();
    }
}

%>