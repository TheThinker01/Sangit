package DAO;

import Bean.Issue;
import Bean.User;
import HelpingClasses.SessionFact;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.ListIterator;

public class IssueDeclaration implements IssueInterface {

    SessionFactory sf;
    Session session;
    Transaction tr;

    public IssueDeclaration() {
    }

    @Override
    public long issueInsert(Issue i) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        tr= session.beginTransaction();
        long l = (Long) session.save(i);
        tr.commit();
        session.close();
        if(l>0)
        {
            return l;
        }
        else {
            return 0;
        }
    }

    @Override
    public long updateIssue(long id, Issue i) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        i.setId(id);// Set the id
        tr = session.beginTransaction();
        session.merge(i);// Update the DB data having same id as st
        tr.commit();// Commit the transaction
        return 1;// Have to do some validation here , regarding username etc .
    }

    @Override
    public boolean deleteIssue(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
            tr = session.beginTransaction();
            Issue issue = session.get(Issue.class,id);
            session.delete(issue);
            tr.commit();
            return true;
        }catch (Exception e)
        {
            if(tr!=null)
                tr.rollback();
            e.printStackTrace();
            return false;
        }
        finally{
            if(session.isOpen())
                session.close();
        }
    }

    @Override
    public Issue selectIssue(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Query query = session.createQuery("from Issue where id=:id");
        query.setLong("id", id);
        List lis = query.list();
        ListIterator listIterator = lis.listIterator();
        Issue res = (Issue) listIterator.next();
        session.close();
        return res;
    }

    @Override
    public List selectAllIssues() {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        tr= session.beginTransaction();
        List res = session.createQuery("from Issue").list();
        session.close();
        if(res.size()>0)
            return res;
        else
            return null;
    }

    @Override
    public List searchByTitle(String title) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        if (title == null) {
            List res = selectAllIssues();
            session.close();
            return res;
        }
        else {
            Query query = session.createQuery("from Issue where title like :searchfield");
            query.setString("searchfield", "%"+title+"%");
            List lis = query.list();
            session.close();
            return lis;
        }
    }

    public List selectByUser(User u)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        long id = u.getId();
        Query query = session.createQuery("from Issue where user.id like :searchfield");
        query.setLong("searchfield", id);
        List lis = query.list();
        session.close();
        return lis;
    }
}
