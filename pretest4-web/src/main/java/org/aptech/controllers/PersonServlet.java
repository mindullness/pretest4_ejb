package org.aptech.controllers;

import org.aptech.entities.Person;
import org.aptech.entities.Phone;
import org.aptech.enums.Actions;
import org.aptech.services.EntityBean;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/person")
public class PersonServlet extends HttpServlet {
    @EJB
    private EntityBean<Person> personBean;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        personBean.setType(Person.class);
        if (Actions.CREATE.toString().equalsIgnoreCase(action)) {
            req.getServletContext().getRequestDispatcher("/WEB-INF/create.jsp").forward(req, resp);
        } else if (Actions.UPDATE.toString().equalsIgnoreCase(action)) {
            String personId = req.getParameter("personId");
            Person person = personBean.getEntityById(Long.parseLong(personId));
            req.setAttribute("person", person);
            req.getServletContext().getRequestDispatcher("/WEB-INF/update.jsp").forward(req, resp);
        } else {
            List<Person> people = personBean.getEntities();
            req.setAttribute("people", people);
            req.getServletContext().getRequestDispatcher("/WEB-INF/people.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        personBean.setType(Person.class);

        if (Actions.CREATE.toString().equalsIgnoreCase(action)) {
            if(create(req, resp)){
                resp.sendRedirect(req.getContextPath()+"/person");
            }else {
                resp.getWriter().write("Failed to create new person");
            }
        } else if (Actions.UPDATE.toString().equalsIgnoreCase(action)) {
            if(update(req, resp)){
                resp.sendRedirect(req.getContextPath()+"/person");
            }else {
                resp.getWriter().write("Failed to update person");
            }
        } else {

        }
    }

    private boolean create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Person person = new Person();
        String[] numbers = req.getParameter("numbers").split(",");
//            long personId = Long.parseLong(req.getParameter("personId"));
//            person.setId(personId);
        long count = 1L;
        for (String num : numbers) {
            Phone phone = new Phone();
//                count++;
//                phone.setId(count);
            phone.setNumber(num.trim());
            person.addPhone(phone);
        }
        return personBean.addEntity(person);
    }

    private boolean update(HttpServletRequest req, HttpServletResponse resp){
        boolean isSuccess = false;
        try {
            Person person = personBean.getEntityById(Long.parseLong(req.getParameter("personId")));

            for (Phone phone : person.getPhones()){
                phone.setNumber(req.getParameter("newNum_"+phone.getId()));
            }
            isSuccess = personBean.updateEntity(person);;
        }catch (Exception ex){ }
        return isSuccess;
    }
}
