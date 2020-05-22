package DAO;

import Bean.Music;
import Bean.Playlist;
import Bean.User;
import HelpingClasses.SessionFact;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.ListIterator;

public class PlaylistDeclaration implements PlaylistInterface {

   SessionFactory sf;
   Session session;
   Transaction tr;

   public PlaylistDeclaration(){

   }

    @Override
    public long playlistInsert(Playlist p) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        tr = session.beginTransaction();
        long l = (Long) session.save(p);
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
    public long updatePlaylist(long id, Playlist p) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        p.setId(id);// Set the id
        tr = session.beginTransaction();
        session.merge(p);// Update the DB data having same id as st
        tr.commit();// Commit the transaction
        session.close();
        return 1;
    }

    @Override
    public boolean deletePlaylist(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
            tr = session.beginTransaction();
            Playlist p = session.get(Playlist.class,id);
            session.delete(p);
            tr.commit();
            return true;
        }catch (Exception e)
        {
            if(tr!=null)
                tr.rollback();
            e.printStackTrace();
            return false;
        }finally {
            if(session.isOpen())
                session.close();
        }
    }

    @Override
    public Playlist selectPlaylist(long id) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Query query = session.createQuery("from Playlist where id=:id");
        query.setLong("id", id);
        List lis = query.list();
        ListIterator listIterator = lis.listIterator();
        Playlist res = (Playlist) listIterator.next();
        session.close();
        return res;
    }

    @Override
    public List selectAllPlaylists() {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        tr= session.beginTransaction();
        List res = session.createQuery("from Playlist ").list();
        session.close();
        if(res.size()>0)
            return res;
        else
            return null;
    }

    @Override
    public List searchByName(String name) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        if (name == null) {
            List res = selectAllPlaylists();
            session.close();
            return res;
        }
        else {
            Query query = session.createQuery("from Playlist where name like :searchfield");
            query.setString("searchfield", "%"+name+"%");
            List lis = query.list();
            session.close();
            return lis;
        }
    }

    @Override
    public List selectByUser(User u) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        long id = u.getId();
        Query query = session.createQuery("from Playlist where user.id like :searchfield");
        query.setLong("searchfield", id);
        List lis = query.list();
        session.close();
        return lis;


    }

    public static void main(String[] args)
    {
        UserInterface ui = new UserDeclaration();
        User u = ui.selectUser(14);

        MusicInterface mi = new MusicDeclaration();
        Music m1 = mi.selectMusic(39);
        Music m2 = mi.selectMusic(42);
        Music m3 = mi.selectMusic(43);

        Playlist p = new Playlist("#1","global");
        p.setUser(u);
        p.getSongList().add(m1);
        p.getSongList().add(m2);

        Playlist p2 = new Playlist("#2","global");
        p.setUser(u);
        p.getSongList().add(m2);
        p.getSongList().add(m3);

        PlaylistInterface pi = new PlaylistDeclaration();
//        pi.playlistInsert(p);
//        pi.playlistInsert(p2);
        List res = pi.selectByUser(u);
        ListIterator listIterator = res.listIterator();
        Playlist us = (Playlist) listIterator.next();
        System.out.println(us.getName());
    }
}
