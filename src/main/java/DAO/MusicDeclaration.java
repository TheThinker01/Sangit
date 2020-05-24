package DAO;

import Bean.Music;
import HelpingClasses.SessionFact;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.ListIterator;

public class MusicDeclaration implements MusicInterface {

    SessionFactory sf;
    Session session;
    Transaction tr;


    public MusicDeclaration() {

    }


    @Override
    public long musicInsert(Music m) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        tr= session.beginTransaction();
        long l = (Long) session.save(m);
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
    public long updateMusic(long id, Music m) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        m.setId(id);// Set the id
        tr = session.beginTransaction();
        session.merge(m);// Update the DB data having same id as st
        tr.commit();// Commit the transaction
        return 1;// Have to do some validation here , regarding username etc .
    }

    @Override
    public boolean deleteMusic(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
            tr = session.beginTransaction();
            Music music = session.get(Music.class,id);
            session.delete(music);
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
    public Music selectMusic(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Query query = session.createQuery("from Music where id=:id");
        query.setLong("id", id);
        List lis = query.list();
        ListIterator listIterator = lis.listIterator();
        Music res = (Music) listIterator.next();
        session.close();
        return res;
    }

    @Override
    public List selectAllMusics() {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        tr= session.beginTransaction();
        List res = session.createQuery("from Music").list();
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
            List res = selectAllMusics();
            session.close();
            return res;
        }
        else {
            Query query = session.createQuery("from Music where title like :searchfield");
            query.setString("searchfield", "%"+title+"%");
            List lis = query.list();
            session.close();
            return lis;
        }
    }

    @Override
    public List selectByUser(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Query query = session.createQuery("from Music where userid like :searchfield");
        query.setLong("searchfield", id);
        List lis = query.list();
        session.close();
        return lis;
    }

    public static void main(String[] args)
    {
//        Music  m = new Music("Breaking bad", "Archisman Pathak", "Nothing yet","will be updated","Soon",100);
        MusicInterface mi = new MusicDeclaration();
//        for(int i=31;i<=33;i++)
//        {
//            mi.deleteMusic(i);
//
//        }

        mi.deleteMusic(41);
    }

}
