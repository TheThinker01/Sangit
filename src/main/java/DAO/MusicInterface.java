package DAO;

import Bean.Music;

import java.util.List;

public interface MusicInterface {
    long musicInsert(Music m);
    long updateMusic(long id,Music m);
    boolean deleteMusic(long id);
    Music selectMusic(long id);
    List selectAllMusics();
    List searchByTitle(String name);
    List selectByUser(long id);// id = User's id
}
