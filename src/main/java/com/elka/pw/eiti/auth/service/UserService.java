package com.elka.pw.eiti.auth.service;

import com.elka.pw.eiti.auth.entity.User;

public interface UserService {

    public void save(User user);
    public User findByUsername(String username);

}
