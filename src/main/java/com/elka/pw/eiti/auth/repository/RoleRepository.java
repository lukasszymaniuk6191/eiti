package com.elka.pw.eiti.auth.repository;

import com.elka.pw.eiti.auth.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
}