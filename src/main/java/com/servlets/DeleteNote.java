package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteNote extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int noteID = Integer.parseInt(request.getParameter("note_id").trim());
            Session deleteSession = FactoryProvider.getFactory().openSession();

            Note note = deleteSession.get(Note.class,noteID);
            deleteSession.beginTransaction();
            deleteSession.delete(note);
            deleteSession.getTransaction().commit();
            deleteSession.close();
            response.sendRedirect("allNotes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}