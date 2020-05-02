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
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
    }


    @Override
    public long musicInsert(Music m) {
        tr= session.beginTransaction();
        long l = (Long) session.save(m);
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
    public long updateMusic(long id, Music m) {
        m.setId(id);// Set the id
        tr = session.beginTransaction();
        session.update(m);// Update the DB data having same id as st
        tr.commit();// Commit the transaction
        return 1;// Have to do some validation here , regarding username etc .
    }

    @Override
    public boolean deleteMusic(long id) {
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
    }

    @Override
    public Music selectMusic(long id) {
        Query query = session.createQuery("from User where id=:id");
        query.setLong("id", id);
        List lis = query.list();
        ListIterator listIterator = lis.listIterator();
        Music res = (Music) listIterator.next();
        return res;
    }

    @Override
    public List selectAllMusics() {
        tr= session.beginTransaction();
        List res = session.createQuery("from Music").list();
        if(res.size()>0)
            return res;
        else
            return null;
    }

    @Override
    public List searchByTitle(String title) {
        if (title == null) {
            List res = selectAllMusics();
            return res;
        }
        else {
            Query query = session.createQuery("from Music where title like :searchfield");
            query.setString("searchfield", "%"+title+"%");
            List lis = query.list();
            return lis;
        }
    }

    public static void main(String[] args)
    {
//        Music  m = new Music("Breaking bad", "Archisman Pathak", "Nothing yet","will be updated","Soon",100);
        MusicInterface mi = new MusicDeclaration();
//        for(int i=24;i<=29;i++)
//        {
//            mi.deleteMusic(i);
//
//        }

//        mi.deleteMusic(30);
    }

}
