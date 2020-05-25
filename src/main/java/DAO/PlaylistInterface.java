package DAO;

import Bean.Playlist;
import Bean.User;

import java.util.List;

public interface PlaylistInterface {
    long playlistInsert(Playlist p);
    long updatePlaylist(long id,Playlist p);
    boolean deletePlaylist(long id);
    Playlist selectPlaylist(long id);
    List selectAllPlaylists();
    List searchByName(String name);
    List selectByUser(User u);
    List selectByVisibility(String visibility);
}
