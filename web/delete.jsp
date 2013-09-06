<%-- 
    Document   : delete
    Created on : Sep 2, 2013, 4:13:53 AM
    Author     : dkrebodesign.com
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.portofolio.konektor.KoneksiDatabase"%>
<%@page import="java.sql.Connection"%>

<%
Connection koneksi=null;
PreparedStatement ps= null;

String id_data = request.getParameter("id").trim();
String code_negara=request.getParameter("code_negara");
String nama_negara=request.getParameter("nama_negara");

int idData= Integer.parseInt(id_data);
String sqlQueryDelete="delete from countries  where ctr_id=?";


//koneksi = KoneksiDatabase.getKoneksi();

//st = koneksi.prepareStatement("");

try{
koneksi =KoneksiDatabase.getKoneksi();
ps = koneksi.prepareStatement(sqlQueryDelete);
ps.setInt(1, idData);

ps.executeUpdate();

out.println("data telah dengan nama negara:"+nama_negara+"&nbsp;dan code negara "+code_negara+"&nbsp;berhasil di hapus <br />");
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