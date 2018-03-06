package com.elka.pw.eiti.auth.repository;

import com.elka.pw.eiti.auth.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}