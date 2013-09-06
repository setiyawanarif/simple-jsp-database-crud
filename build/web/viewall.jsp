<%-- 
    Document   : viewall
    Created on : Aug 30, 2013, 2:11:56 PM
    Author     : dkrebodesign.com
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.portofolio.konektor.KoneksiDatabase" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr><th>ID</th><th>Code</th><th>Nama</th></tr>
       <% 
           //KoneksiDatabase konek = new KoneksiDatabase();
           Connection koneksi = KoneksiDatabase.getKoneksi();
           Statement stmt =null;
           ResultSet rs = null;
           
           try{
               
           if (koneksi != null){
           stmt =koneksi.createStatement();
           String sql="select * from countries order by ctr_id desc ";
           rs = stmt.executeQuery(sql);
           while(rs.next()){
           int id= rs.getInt("ctr_id");
           String namaNegara= rs.getString("ctr_code");
           String codeNegara = rs.getString("ctr_name");
           
           
           
           out.println("<tr>");
           out.println("<td align=\'left\'>");
           out.println(id);
           out.println("</td>");
           out.println("<td align=\'center\'>"+namaNegara+"</td>");
           out.println("<td align=\'center\'>"+codeNegara+"</td>");
           out.println("<td align=\'center\'>");
           out.println("<a href=\'updateview.jsp?id="+id+"\'> detail </a>");
           out.println("&nbsp;<a href=\'delete.jsp?id="+id+"&nama_negara="+namaNegara+"&code_negara="+codeNegara+"\'>hapus</a>");
           out.println("</td>");
           out.println("</tr>");
           
            }
           
           koneksi.close();
             }else{
           
           out.println("Failed to connect Database");
           koneksi.rollback();
           }
           
           }catch(Exception a){
               out.println(a);
           }
           
           
           
       %>
       
       
       </table>
    </body>
</html>
