package DAO;

import Bean.Issue;
import Bean.User;

import java.util.List;

public interface IssueInterface {
    long issueInsert(Issue i);
    long updateIssue(long id, Issue i);
    boolean deleteIssue(long id);
    Issue selectIssue(long id);
    List selectAllIssues();
    List searchByTitle(String title);
    List selectByUser(User u);
}
