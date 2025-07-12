package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class updateNote extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int noteID = Integer.parseInt(request.getParameter("noteID").trim());
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Session update = FactoryProvider.getFactory().openSession();
            update.beginTransaction();
            Note nEdit = update.get(Note.class,noteID);
            nEdit.setTitle(title);
            nEdit.setContent(content);
            nEdit.setAddedDate(new Date());
            update.getTransaction().commit();
            update.close();
            response.sendRedirect("allNotes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}