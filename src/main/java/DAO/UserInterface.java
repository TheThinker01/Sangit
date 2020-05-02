package DAO;

import Bean.Music;
import Bean.User;

import java.util.List;

public interface UserInterface {
    long userInsert(User u);
    long updateUser(long id,User u);
    boolean deleteUser(long id);
    User selectUser(long id);
    List selectAllUsers();
    List searchByName(String name);
    List searchByCategory(String category);
    User signIn(String username,String password);
    long addSongToQueue(long id,Music m);
    int emptyQueue(long id);

}
