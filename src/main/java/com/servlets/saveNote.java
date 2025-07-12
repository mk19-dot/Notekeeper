package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class saveNote extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            //Fetching Title & Content
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Note note = new Note(title,content,new Date());
//            System.out.println(note.getNoteID() + " " +note.getTitle());
             Session session = FactoryProvider.getFactory().openSession();
             session.beginTransaction();
             session.save(note);
             session.getTransaction().commit();
             session.close();
             response.setContentType("text/html");
             PrintWriter out = response.getWriter();
             out.println("<h1 style='text-align:center;'> Note is added successfully. </h1>");
             out.println("<h1 style='text-align:center;'><a href='allNotes.jsp'>View all notes </a></h1>");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}