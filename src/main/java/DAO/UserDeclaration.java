package DAO;

import Bean.User;
import HelpingClasses.SessionFact;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.ListIterator;

public class UserDeclaration implements UserInterface{

    SessionFactory sf;
    Session session;
    Transaction tr;

    public UserDeclaration() {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public long userInsert(User u) {
        tr= session.beginTransaction();
        long l = (Long) session.save(u);
        tr.commit();
        if(l>0)
        {
            return l;
        }
        else {
            return 0;
        }
    }

    @Override
    public long updateUser(long id,User u) {
        u.setId(id);// Set the id
        tr = session.beginTransaction();
        session.update(u);// Update the DB data having same id as st
        tr.commit();// Commit the transaction
        return 1;// Have to do some validation here , regarding username etc .
    }

    @Override
    public boolean deleteUser(long id) {
        try{
            tr = session.beginTransaction();
            User user = session.get(User.class,id);
            session.delete(user);
            tr.commit();
            return true;
        }catch (Exception e)
        {
            if(tr!=null)
                tr.rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User selectUser(long id) {
        Query query = session.createQuery("from Student where s_id=:id");
        query.setLong("id", id);
        List lis = query.list();
        ListIterator listIterator = lis.listIterator();
        User res = (User) listIterator.next();
        return res;
    }

    @Override
    public List selectAllUsers() {
        tr= session.beginTransaction();
        List res = session.createQuery("from User").list();
        if(res.size()>0)
            return res;
        else
            return null;
    }

    @Override
    public List searchByName(String name) {
        if (name == null) {
            List res = selectAllUsers();
            return res;
        }
        else {
            Query query = session.createQuery("from User where name like :searchfield");
            query.setString("searchfield", "%"+name+"%");
            List lis = query.list();
            return lis;
        }
    }

    @Override
    public List searchByCategory(String category) {
        if (category == null) {
            List res = selectAllUsers();
            return res;
        }
        else {
            Query query = session.createQuery("from User where category like :searchfield");
            query.setString("searchfield", "%"+category+"%");
            List lis = query.list();
            return lis;
        }
    }

    public static void main(String[] args){
        System.out.println("This is working!!!");
    }
}