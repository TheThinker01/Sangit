package Bean;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

@Entity
public class User {
    @Id
    @GeneratedValue
    private long id;
    private String name,password,category;
    @Column(unique = true,nullable = false)
    private String email,mobile_num,username;
    private String photopath;

    @OneToMany(cascade = CascadeType.ALL)
    private Collection<Music> musicQueue = new ArrayList<Music>();

    public User() {
    }

    public User(String name, String password, String email, String mobile_num,String category,String photopath ,String username) {

        this.category = category;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile_num = mobile_num;
        this.username = username;
        this.photopath = photopath;
    }

    public Collection<Music> getMusicQueue() {
        return musicQueue;
    }

    public void setMusicQueue(Collection<Music> musicQueue) {
        this.musicQueue = musicQueue;
    }

    public String getphotopath() {
        return photopath;
    }

    public void setphotopath(String photopath) {
        this.photopath = photopath;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile_num() {
        return mobile_num;
    }

    public void setMobile_num(String mobile_num) {
        this.mobile_num = mobile_num;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
