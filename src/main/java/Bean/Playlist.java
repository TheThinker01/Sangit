package Bean;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Playlist {
    @Id @GeneratedValue
    long id;

    private String name,visibilty;

    @ManyToOne
    private User user;

    @OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private Set<Music> songList = new HashSet<Music>();

    public Playlist() {
    }

    public Playlist(String name,String visibilty){
        this.name = name;
        this.visibilty = visibilty;
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

    public String getVisibilty() {
        return visibilty;
    }

    public void setVisibilty(String visibilty) {
        this.visibilty = visibilty;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User u) {
        this.user = u;
    }

    public Set<Music> getSongList() {
        return songList;
    }

    public void setSongList(Set<Music> songList) {
        this.songList = songList;
    }
}
