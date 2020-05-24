package Bean;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Music {

    @Id
    @GeneratedValue
    private long id;

    String title, artist, albumart, song, mediapath;
    long rating,ratingCount;
    long duration;

    private long userid;

    @ManyToMany(mappedBy = "songList",fetch = FetchType.EAGER)
    private Set<Playlist> playlists = new HashSet<Playlist>();


    public Music() {
    }

    public Music(long rating,long ratingCount , String title, String artist, String albumart, String song, String mediapath, long duration,long userid) {
        this.rating = rating;
        this.ratingCount = ratingCount;
        this.title = title;
        this.artist = artist;
        this.albumart = albumart;
        this.song = song;
        this.mediapath = mediapath;
        this.duration = duration;
        this.userid = userid;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public Set<Playlist> getPlaylists() {
        return playlists;
    }

    public void setPlaylists(Set<Playlist> playlists) {
        this.playlists = playlists;
    }

    public void addToPlaylists(Playlist p){this.playlists.add(p);}

    public void removeFromPlaylists(Playlist p){this.playlists.remove(p);}

    public long getRating() {
        return rating;
    }

    public void setRating(long rating) {
        this.rating = rating;
    }

    public long getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(long ratingCount) {
        this.ratingCount = ratingCount;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMediapath() {
        return mediapath;
    }

    public void setMediapath(String mediapath) {
        this.mediapath = mediapath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getAlbumart() {
        return albumart;
    }

    public void setAlbumart(String albumart) {
        this.albumart = albumart;
    }

    public String getSong() {
        return song;
    }

    public void setSong(String song) {
        this.song = song;
    }

    public long getDuration() {
        return duration;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Music music = (Music) o;
        return id == music.id &&
                rating == music.rating &&
                ratingCount == music.ratingCount &&
                duration == music.duration &&
                Objects.equals(title, music.title) &&
                Objects.equals(artist, music.artist) &&
                Objects.equals(albumart, music.albumart) &&
                Objects.equals(song, music.song) &&
                Objects.equals(mediapath, music.mediapath);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, artist, albumart, song, mediapath, rating, ratingCount, duration);
    }
}
