<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=US-ASCII>
<title>All Notes</title>
    <%@include file="header.jsp"%>

</head>
<body>
          <div class="container-fluid">
              <%@include file="navbar.jsp" %>
              <br>
          </div>
          <h1 class="text-uppercase" style="text-align:center;"> Viewing all notes </h1>
          <div class="row">
          <div class="col-12">
            <%
                      Session hibernateSession = FactoryProvider.getFactory().openSession();
                      Query q = hibernateSession.createQuery("from Note");
                      List <Note> list =q.list();
                      for(Note note : list){
                       %>
                       <div class="card mt-3">
                         <img class="card-img-top m-4" style = "max-width:55px;"src="img/note_icon.png" alt="Card image cap">
                         <div class="card-body">
                          <div class="d-flex justify-content-between align-items-center px-2">
                          <%
                              java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy");
                          %>
                              <h5 class="card-title mb-0"><%= note.getTitle() %></h5>
                              <small class="text-muted"><b><%= sdf.format(note.getAddedDate()) %></b></small>
                          </div>
                           <p class="card-text px-2"><%= note.getContent()%></p>
                           <div class="d-flex px-2">
                           <a href="DeleteNote?note_id=<%=note.getNoteID()%>" class="btn btn-danger">Delete</a>
                           <a href="editNote.jsp?note_id=<%=note.getNoteID()%>" class="btn btn-primary ml-2">Edit</a>
                           </div>
                         </div>
                       </div>
                      <%
                      }
                      hibernateSession.close();

                      %>
          </div>
          </div>
</body>
</html>