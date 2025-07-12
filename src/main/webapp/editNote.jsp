<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=US-ASCII>
    <%@include file="header.jsp"%>
</head>
<body>
    <div class="container-fluid">
    <%
      request.setAttribute("navActive", "show");
    %>

              <%@include file="navbar.jsp" %>
              <br><h1> Edit your note</h1>
          </div>

          <div>
          <%
            int noteID = Integer.parseInt(request.getParameter("note_id").trim());
             Session editSession = FactoryProvider.getFactory().openSession();
             Note note = editSession.get(Note.class,noteID);
            editSession.close();
         %>
         <form action="updateNote" method="post">
                <input value="<%=note.getNoteID()%>" name="noteID" type="hidden"/>
                 <div class="form-group">
                   <label for="noteTitle">Note Title</label>
                   <input required name = "title" type="text" class="form-control" id="noteTitle" aria-describedby="emailHelp"
                   placeholder="Enter title" value="<%=note.getTitle()%>"/>
                 </div>

                 <div class="form-group">
                   <label for="noteContent">Content</label>
                  <textarea required name="content" id="nContent" placeholder="Enter your note" class="form-control" style=height:200px><%=note.getContent()%>
                   </textarea>
                 </div>
                 <div class="container text-center">
                 <button type="submit" class="btn btn-success">Save Note</button>
                 </div>
               </form>
          </div>
</body>
</html>