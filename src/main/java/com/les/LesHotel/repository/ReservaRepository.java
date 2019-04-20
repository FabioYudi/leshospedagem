package com.les.LesHotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.les.LesHotel.entities.Reserva;

@Repository
public interface ReservaRepository extends JpaRepository<Reserva, Long> {

}
