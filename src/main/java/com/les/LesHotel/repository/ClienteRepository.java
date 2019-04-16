package com.les.LesHotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.les.LesHotel.entities.ClienteAluguel;

@Repository
public interface ClienteRepository extends JpaRepository<ClienteAluguel, Long> {

}
